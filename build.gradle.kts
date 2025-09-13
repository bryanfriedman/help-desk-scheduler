import org.gradle.api.tasks.bundling.War

plugins {
    id("java")
    id("war")
    id("org.openrewrite.rewrite") version "latest.release"
}

java {
    sourceCompatibility = JavaVersion.VERSION_1_8
    targetCompatibility = JavaVersion.VERSION_1_8
    toolchain {
        languageVersion.set(JavaLanguageVersion.of(8))
    }
}

repositories {
    mavenCentral()
}

rewrite {
    activeRecipe("com.bryanfriedman.rewrite.struts.UpdateStruts1")
    exclusion("recipes/**")
}

dependencies {
    // OpenRewrite runtime on the 'rewrite' configuration
    rewrite(platform("org.openrewrite.recipe:rewrite-recipe-bom:latest.release"))
    rewrite("org.openrewrite.recipe:rewrite-migrate-java")
    rewrite(project(":recipes"))

    implementation("javax.servlet:servlet-api:2.4")
    implementation("javax.servlet:jstl:1.2")
    compileOnly("com.sun.mail:javax.mail:1.6.2")
    compileOnly("struts:struts:1.1") {
        isTransitive = false
    }

    // To use local jars in libs/
    //implementation(fileTree(mapOf("dir" to "libs", "include" to listOf("*.jar"))))
}

tasks.named<War>("war") {
    destinationDirectory.set(file("$buildDir/dist"))
    archiveFileName.set("hds.war")
}