# frozen_string_literal: true

class SubjectsController < ApplicationController
  before_action :parse_params

  def index;  end

  def new_subject; end

  def create_new_subject
    @sub = @subjects.detect { |i| i.name == params[:name] }
    if @sub.nil?
      @sub = Subject.new do |s|
        s.name = params[:name]
        s.kind = params[:kind]
        s.user_id = current_user.id
      end
      @flagt = false
    else
      @sub.kind = params[:kind]
      @flagt = true
    end

    @sub.save
  end

  def new_task; end

  def create_new_task
    n = params[:tname]
    d = params[:tid]
    @task = @tasks.select { |i| i.name == n && i.subject_id.to_s == d }.first
    if @task.nil?
      @task = Task.new do |t|
        t.name = n
        t.deadline = params[:deadline]
        t.max = params[:max]
        t.current = params[:current]
        t.subject_id = d
      end
      @flagt = false
    else
      @task.deadline = params[:deadline]
      @task.max = params[:max]
      @task.current = params[:current]
      @flagt = true

    end
    @task.save
  end

  def prep_del_sub; end

  def del_subject
    @del_sub = Subject.find(params[:did])
    @del_sub.destroy
  end

  def prep_del_task; end

  def del_task
    @del_t = Task.find(params[:dtid])
    @del_t.destroy
  end

  private

  def parse_params
    @subjects = Subject.all.select { |i| i.user_id == current_user.id }
    @sub_num = @subjects.count unless @subjects.nil?

    @tasks = Task.all.order(:deadline).select { |i| @subjects.map(&:id).include?(i.subject_id) }
    @task_num = @tasks.count unless @tasks.nil?
  end

  def statistic; end
end
