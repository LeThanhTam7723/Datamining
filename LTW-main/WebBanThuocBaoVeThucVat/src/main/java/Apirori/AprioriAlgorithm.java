package Apirori;

import bean.Products;
import dao.ProductDAO;

import java.util.*;

public class AprioriAlgorithm {
    private static final int MIN_SUPPORT = 2;

    // Phương thức chính để tìm tập phổ biến
    public static List<Set<Integer>> apriori(List<Set<Integer>> transactions) {
        List<Set<Integer>> frequentItemsets = new ArrayList<>();
        Map<Set<Integer>, Integer> itemCountMap = new HashMap<>();

        // Bước 1: Tính toán tập phổ biến cấp 1 (L1)
        for (Set<Integer> transaction : transactions) {
            for (Integer item : transaction) {
                Set<Integer> singleItemSet = Collections.singleton(item);
                itemCountMap.put(singleItemSet, itemCountMap.getOrDefault(singleItemSet, 0) + 1);
            }
        }

        // Bước 2: Lọc các tập phổ biến thỏa mãn ngưỡng support
        Map<Set<Integer>, Integer> frequentItems = filterBySupport(itemCountMap);

        // Lưu tập phổ biến cấp 1
        frequentItemsets.addAll(frequentItems.keySet());

        // Bước 3: Sinh tập phổ biến cấp cao hơn
        int k = 2;
        while (!frequentItems.isEmpty()) {
            Map<Set<Integer>, Integer> candidateItemsets = generateCandidates(frequentItems.keySet(), k);

            // Đếm số lần xuất hiện của các tập ứng viên trong dữ liệu
            for (Set<Integer> transaction : transactions) {
                for (Set<Integer> candidate : candidateItemsets.keySet()) {
                    if (transaction.containsAll(candidate)) {
                        candidateItemsets.put(candidate, candidateItemsets.get(candidate) + 1);
                    }
                }
            }

            // Bước 4: Lọc tập phổ biến theo support
            frequentItems = filterBySupport(candidateItemsets);
            frequentItemsets.addAll(frequentItems.keySet());
            k++;
        }

        return frequentItemsets;
    }

    // Lọc tập phổ biến theo ngưỡng support
    private static Map<Set<Integer>, Integer> filterBySupport(Map<Set<Integer>, Integer> itemCountMap) {
        Map<Set<Integer>, Integer> result = new HashMap<>();
        for (Map.Entry<Set<Integer>, Integer> entry : itemCountMap.entrySet()) {
            if (entry.getValue() >= MIN_SUPPORT) {
                result.put(entry.getKey(), entry.getValue());
            }
        }
        return result;
    }

    // Sinh tập ứng viên cấp k từ tập phổ biến cấp (k-1)
    private static Map<Set<Integer>, Integer> generateCandidates(Set<Set<Integer>> previousItemsets, int k) {
        Map<Set<Integer>, Integer> candidates = new HashMap<>();
        List<Set<Integer>> itemsetsList = new ArrayList<>(previousItemsets);
        int size = itemsetsList.size();

        for (int i = 0; i < size; i++) {
            for (int j = i + 1; j < size; j++) {
                Set<Integer> itemset1 = itemsetsList.get(i);
                Set<Integer> itemset2 = itemsetsList.get(j);

                // Hợp hai tập nếu có (k-1) phần tử chung
                Set<Integer> candidate = new HashSet<>(itemset1);
                candidate.addAll(itemset2);

                if (candidate.size() == k) {
                    candidates.put(candidate, 0);
                }
            }
        }
        return candidates;
    }

    // Tìm các sản phẩm thường xuyên mua kèm với A
    public static List<Integer> findFrequentItemsWithA(List<Set<Integer>> transactions, Integer targetItem) {
        Map<Integer, Integer> itemFrequency = new HashMap<>();

        for (Set<Integer> transaction : transactions) {
            if (transaction.contains(targetItem)) {
                for (Integer item : transaction) {
                    if (!item.equals(targetItem)) { // Loại bỏ A
                        itemFrequency.put(item, itemFrequency.getOrDefault(item, 0) + 1);
                    }
                }
            }
        }

        // Sắp xếp danh sách sản phẩm theo số lần xuất hiện
        List<Map.Entry<Integer, Integer>> sortedItems = new ArrayList<>(itemFrequency.entrySet());
        sortedItems.sort((a, b) -> b.getValue().compareTo(a.getValue())); // Sắp xếp giảm dần

        // Lấy 3 sản phẩm phổ biến nhất đi kèm với A
        List<Integer> top3Items = new ArrayList<>();
        for (int i = 0; i < Math.min(3, sortedItems.size()); i++) {
            top3Items.add(sortedItems.get(i).getKey());
        }

        return top3Items;
    }

    public static void main(String[] args) {
        ProductDAO productDAO = new ProductDAO();
        List<Set<Integer>> transactions = productDAO.transactions();
        System.out.println("Các đơn hàng");
        for (Set<Integer> itemset : transactions) {
            System.out.println(itemset);
        }

        // Áp dụng Apriori
        List<Set<Integer>> frequentItemsets = apriori(transactions);

        System.out.println("Các tập phổ biến:");
        for (Set<Integer> itemset : frequentItemsets) {
            System.out.println(itemset);
        }

        // Tìm sản phẩm mua kèm với A (A=1)
        List<Integer> topItemsWithA = findFrequentItemsWithA(transactions, 2);
        System.out.println("\nTop 3 sản phẩm mua kèm với A (2):");
        List<Products> topItems = productDAO.getThePopular(topItemsWithA);
        for(Products p : topItems){
            System.out.println(p);
        }


    }
}