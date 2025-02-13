package dao.admin;

import bean.Import;
import db.JDBIConnector;
import org.jdbi.v3.core.Jdbi;
import java.util.List;

public class ImportDao {
    // Lấy danh sách các đơn nhập hàng
    public static List<Import> getList() {
        String sql = "SELECT imports.id,imports.id_product,imports.quantity,products.product_name,imports.price,imports.date_import,imports.status FROM imports join " +
                "products on imports.id_product = products.id";
        Jdbi jdbi = JDBIConnector.getJdbi();
        return jdbi.withHandle(handle ->
                handle.createQuery(sql)
                        .mapToBean(Import.class)
                        .list()
        );
    }

    // Thêm đơn nhập hàng

    public static boolean insertImport(Import order) {
        String insertImportSql = "INSERT INTO imports (id_product, quantity, price, status) VALUES (?,?,?,'Chưa Giao')";
        Jdbi jdbi = JDBIConnector.getJdbi();

        return jdbi.withHandle(handle ->
                handle.createUpdate(insertImportSql)
                        .bind(0, order.getId_product())
                        .bind(1, order.getQuantity())
                        .bind(2, order.getPrice())
                        .execute() > 0
        );
    }


    // Xóa đơn nhập hàng
    public static boolean deleteImport(int orderId) {
        Jdbi jdbi = JDBIConnector.getJdbi();
        int rowsAffected = jdbi.withHandle(handle ->
                handle.createUpdate("DELETE FROM imports WHERE id = ?")
                        .bind(0, orderId)
                        .execute()
        );
        return rowsAffected > 0;
    }

    // Cập nhật đơn nhập hàng dựa trên id import

    public static boolean updateImport(int importId, String status) {
        String updateImportSql = "UPDATE imports SET status = ? WHERE id = ?";
        String updateProductSql = "UPDATE products SET inventory_quantity = inventory_quantity + ? WHERE id = ?";
        Jdbi jdbi = JDBIConnector.getJdbi();

        return jdbi.inTransaction(handle -> {
            // Cập nhật trạng thái của đơn hàng
            int rowsAffected = handle.createUpdate(updateImportSql)
                    .bind(0, status)
                    .bind(1, importId)
                    .execute();
            // Nếu cập nhật trạng thái thành công và trạng thái là "Đã Giao", cập nhật số lượng sản phẩm
            if (rowsAffected > 0 && "Đã Giao".equalsIgnoreCase(status)) {
                // Lấy thông tin đơn hàng từ bảng imports
                Import order = handle.createQuery("SELECT id_product, quantity FROM imports WHERE id = ?")
                        .bind(0, importId)
                        .map((rs, ctx) -> new Import(
                                rs.getInt("id_product"),
                                rs.getInt("quantity")
                        ))
                        .findOne()
                        .orElse(null);

                if (order != null) {
                    // Cập nhật số lượng tồn kho
                    int updateRows = handle.createUpdate(updateProductSql)
                            .bind(0, order.getQuantity())
                            .bind(1, order.getId_product())
                            .execute();

                    return updateRows > 0;
                }
            }

            return rowsAffected > 0; // Trả về true nếu chỉ cập nhật trạng thái thành công
        });
    }


    // lấy import bằng id
    public static Import getImportById(int importId) {
        Jdbi jdbi = JDBIConnector.getJdbi();
        return jdbi.withHandle(handle ->
                handle.createQuery("SELECT imports.id,imports.id_product,imports.quantity,products.product_name,imports.price,imports.date_import,imports.status FROM imports join " +
                        "products on imports.id_product = products.id WHERE imports.id =?")
                       .bind(0, importId)
                       .mapToBean(Import.class)
                       .one()
        );
    }

    public static void main(String[] args) {


//        System.out.println(ImportDao.getList());
////        ImportDao.updateImport(1,"Đã Giao");
////        ImportDao.deleteImport(1);
//        Import i1 = new Import();
//        i1.setId_product(3);
//        i1.setQuantity(20);
//        i1.setPrice(5000);
//        ImportDao.insertImport(i1);
        System.out.println(ImportDao.getImportById(2));;
    }
}


