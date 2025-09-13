plugins {
    id("java")
}

group = "com.bryanfriedman"
version = "0.1.0"

repositories {
    mavenCentral()
}

dependencies {
    compileOnly("org.openrewrite:rewrite-java:latest.release")

    testImplementation("org.openrewrite:rewrite-test:latest.release")
    testImplementation("org.openrewrite:rewrite-java:latest.release")
    testImplementation("org.junit.jupiter:junit-jupiter:5.10.2")
    testImplementation("org.openrewrite:rewrite-java-17:latest.release")

    // External types used in snippets
    testImplementation(files("../libs/struts.jar"))
    testImplementation("javax.servlet:servlet-api:2.4")
}

tasks.test {
    useJUnitPlatform()
}

java {
    toolchain {
        languageVersion.set(JavaLanguageVersion.of(21))
    }
}