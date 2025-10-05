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

    compileOnly("org.projectlombok:lombok:latest.release")
    annotationProcessor("org.projectlombok:lombok:latest.release")
    testImplementation("org.projectlombok:lombok:latest.release")

    testImplementation("org.openrewrite:rewrite-test:latest.release")
    testImplementation("org.openrewrite:rewrite-java:latest.release")
    testImplementation("org.junit.jupiter:junit-jupiter:5.10.2")
    testImplementation("org.openrewrite:rewrite-java-17:latest.release")

    // External types used in snippets
    testImplementation("javax.servlet:servlet-api:2.4")
    testImplementation("struts:struts:1.1") {
        isTransitive = false
    }
}

tasks.test {
    useJUnitPlatform()
}

tasks.withType<JavaCompile>().configureEach {
    options.compilerArgs.add("-parameters")
}

java {
    toolchain {
        languageVersion.set(JavaLanguageVersion.of(21))
    }
}