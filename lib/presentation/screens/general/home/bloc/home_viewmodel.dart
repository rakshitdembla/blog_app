import 'dart:developer';

import 'package:blog_app/data/repositories/repository.dart';
import 'package:blog_app/presentation/screens/general/home/bloc/home_events.dart';
import 'package:blog_app/presentation/screens/general/home/bloc/home_states.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class HomeViewmodel extends Bloc<HomeEvents, HomeStates> {
  Repository repository;
  HomeViewmodel({required this.repository}) : super(HomeInitialState()) {
    on<fetchblogs>((event, emit) async {
       //log("📢 Event Triggered: fetchblogs() called");
      emit(HomeLoadingState());
        //log("⏳ Loading State Emitted... Fetching blogs...");
      try {
        final postsdata = await repository.postsrepo.getallposts();
         //log("🔍 Blog Data Received: ${postsdata.all_posts?.length ?? 0} posts found");


        if (postsdata.status == 1) {
          emit(HomeLoadedState(bloglist: postsdata.all_posts ?? []));
             //log("✅ HomeLoadedState Emitted! Blogs Available: ${postsdata.all_posts?.length ?? 0}");
         
        } else {
          emit(HomeErrorState(error: "Error fetching in posts"));
           //log("🚨 HomeErrorState Emitted! API returned status != 1");
        }
      } catch (e) {
        emit(HomeErrorState(error: e.toString()));
         //log("🚨 HomeErrorState Emitted! API returned status != 1");
      }
    });
  }
}
