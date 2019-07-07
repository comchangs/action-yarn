# action-yarn
A github action for yarn installing and building

## Usage
### Angular
```workflow
workflow "Build on push" {
  on = "push"
  resolves = [
    "comchangs/action-yarn@master"
  ]
}
action "comchangs/action-yarn@master" {
  uses = "comchangs/action-yarn@master"
  args = "yarn install; yarn ng build"
}
```

### Multiple project (Kotlin Maven and Angular)
```workflow
workflow "Build on push" {
  on = "push"
  resolves = [
    "comchangs/action-maven@master"
  ]
}

action "comchangs/action-maven@master" {
  uses = "comchangs/action-maven@master"
  args = "clean install compile package"
  needs = [
    "comchangs/action-yarn@master",
  ]
}

action "comchangs/action-yarn@master" {
  uses = "comchangs/action-yarn@master"
  args = "cd exitcode-frontend; yarn install; yarn ng build"
}
```
