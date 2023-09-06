// This file is auto-generated by ./bin/rails stimulus:manifest:update
// Run that command whenever you add a new controller or create them with
// ./bin/rails generate stimulus controllerName

import { application } from "./application"

import FollowUserController from "./follow_user_controller"
application.register("follow-user", FollowUserController)

import LikeButtonController from "./like_button_controller"
application.register("like-button", LikeButtonController)

import ModalController from "./modal_controller"
application.register("modal", ModalController)

import ToggleController from "./toggle_controller"
application.register("toggle", ToggleController)
