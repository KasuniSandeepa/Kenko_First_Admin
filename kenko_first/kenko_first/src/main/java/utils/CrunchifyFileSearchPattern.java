package utils;

import java.nio.file.*;
import java.nio.file.attribute.BasicFileAttributes;

public class CrunchifyFileSearchPattern extends SimpleFileVisitor<Path> {

    // An interface that is implemented by objects that perform match operations on paths
    private final PathMatcher crunchifyPathMatcher;

    private static int counter = 0;

    CrunchifyFileSearchPattern(String crunchifyPattern) {

        // getPathMatcher() returns a PathMatcher that performs match operations on the String
        // representation of Path objects by
        // interpreting a given pattern
        crunchifyPathMatcher = FileSystems.getDefault().getPathMatcher("glob:"
                + crunchifyPattern);
    }

    // Invoked for a file in a directory
    @Override
    public FileVisitResult visitFile(Path crunchifyPath, BasicFileAttributes crunchifyFileAttr) {

        // Tells if given path matches this matcher's pattern
        if (crunchifyPathMatcher.matches(crunchifyPath.getFileName())) {
            counter++;
            log(crunchifyPath);
        }
        return FileVisitResult.CONTINUE;
    }

    // Invoked for a directory before entries in the directory are visited
    @Override
    public FileVisitResult preVisitDirectory(Path crunchifyPath,
                                             BasicFileAttributes crunchifyFileAttr) {
        if (crunchifyPathMatcher.matches(crunchifyPath.getFileName())) {
            counter++;
            log(crunchifyPath);
        }
        return FileVisitResult.CONTINUE;
    }

    // Simple log utility
    static void log(Object value) {
        System.out.println(value);

    }

    // Returns total number of matches for your pattern
    public int crunchifyTotalCount() {
        return counter;
    }

}
