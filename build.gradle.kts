import org.gradle.api.tasks.bundling.War

plugins {
    id("java")
    id("war")
    id("org.openrewrite.rewrite") version "latest.release"
}

java {
    sourceCompatibility = JavaVersion.VERSION_21
    targetCompatibility = JavaVersion.VERSION_21
    toolchain {
        languageVersion.set(JavaLanguageVersion.of(21))
    }
}

repositories {
    mavenCentral()
}

rewrite {
    activeRecipe("com.bryanfriedman.rewrite.UpgradeHDS")
    exclusion("recipes/**")
    exclusion("archive/**")
}

dependencies {
    // OpenRewrite runtime on the 'rewrite' configuration
    rewrite(platform("org.openrewrite.recipe:rewrite-recipe-bom:latest.release"))
    rewrite("org.openrewrite.recipe:rewrite-migrate-java")
    rewrite(project(":recipes"))

    implementation("jakarta.servlet:jakarta.servlet-api:6.0.0")
    implementation("org.eclipse.angus:angus-activation:2.0.2")
    implementation("org.glassfish.web:jakarta.servlet.jsp.jstl:3.0.1")
    implementation("org.eclipse.angus:angus-mail:2.0.3")
    
    implementation("io.github.weblegacy:struts-core:1.5.0-RC2")
    implementation("io.github.weblegacy:struts-taglib:1.5.0-RC2")
    implementation("io.github.weblegacy:struts-tiles:1.5.0-RC2")
}

tasks.named<War>("war") {
    destinationDirectory = layout.buildDirectory.dir("dist")
    archiveFileName.set("hds.war")
}