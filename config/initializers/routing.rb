# Adds run route to all satellites
require 'action_dispatch/routing/mapper'

module ActionDispatch::Routing::Mapper::Resources
  def resource(*resources, &block)
    options = resources.extract_options!.dup

    if apply_common_behavior_for(:resource, resources, options, &block)
      return self
    end

    resource_scope(:resource, SingletonResource.new(resources.pop, options)) do
      yield if block_given?

      concerns(options[:concerns]) if options[:concerns]

      collection do
        post :create if parent_resource.actions.include?(:create)
        post :run if @scope[:as] == 'satellites'
      end

      new do
        get :new
      end if parent_resource.actions.include?(:new)

      set_member_mappings_for_resource
    end

    self
  end

  def resources(*resources, &block)
    options = resources.extract_options!.dup

    if apply_common_behavior_for(:resources, resources, options, &block)
      return self
    end

    resource_scope(:resources, Resource.new(resources.pop, options)) do
      yield if block_given?

      concerns(options[:concerns]) if options[:concerns]

      collection do
        get  :index if parent_resource.actions.include?(:index)
        post :create if parent_resource.actions.include?(:create)
        post :run if @scope[:as] == 'satellites'
      end

      new do
        get :new
      end if parent_resource.actions.include?(:new)

      set_member_mappings_for_resource
    end

    self
  end
end
