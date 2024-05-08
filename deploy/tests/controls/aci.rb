
# Reference documentation for the properties that are returned for ACI
# https://learn.microsoft.com/en-us/rest/api/container-instances/container-groups/get?view=rest-container-instances-2023-05-01&tabs=HTTP

control "azure-container-instances" do
  title "Azure Container Instances"
  desc "Ensure that the Azure Container Instances have been deployed as expected"

  describe azure_container_instance(
    container_group_name: input("container_group_name"),
    resource_group: input("resource_group_name"),
    subscription_id: input("subscription_id"),
    api_version: input("api_version")
  ) do
    it { should exist }
    its("container_group_name") { should cmp input("container_group_name") }
    its("resource_group") { should cmp input("resource_group_name") }
    its("subscription_id") { should cmp input("subscription_id") }
    its("api_version") { should cmp input("api_version") }
  end
end

