package utils;

import java.util.Collections;
import java.util.List;

public class Pagination {

//    public static void main(String[] args) {
//        List<LandAndCrop> LandsList = LandsAndCropsOfProfileGet(1);
//        List<LandAndCrop> LandsListPaginated = getPage(LandsList, 1, 2);
//        for (LandAndCrop l : LandsListPaginated
//                ) {
//            System.out.println(l.get_LandId() + ", " + l.get_LandName() + ", "
//                    + l.get_CropId() + ", " + l.get_CropName());
//        }
//    }

    public static List<models.LandAndCrop> getPage(List<models.LandAndCrop> sourceList,
                                                                 int page, int pageSize) {
        if (pageSize <= 0 || page <= 0) {
            throw new IllegalArgumentException("invalid page size: " + pageSize);
        }

        int fromIndex = (page - 1) * pageSize;
        if (sourceList == null || sourceList.size() <= fromIndex) {
            return Collections.emptyList();
        }

        // toIndex exclusive
        return sourceList.subList(fromIndex, Math.min(fromIndex + pageSize, sourceList.size()));
    }

}

/*
1, Home Garden, 1, Carrot
1, Home Garden, 2, Leaks
 */
