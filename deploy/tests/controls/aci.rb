
# Reference documentation for the properties that are returned for ACI Group:
## https://learn.microsoft.com/en-us/rest/api/container-instances/container-groups/get?view=rest-container-instances-2023-05-01&tabs=HTTP
# Inspec Documentation for further testing development:
## https://docs.chef.io/inspec/resources/azure_container_group/

control "azure-container-instances" do
  title "Azure Container Instances"
  desc "Ensure that the Azure Container Instances have been deployed as expected"

  describe azure_container_group(
    name: input("container_group_name"),
    resource_group: input("resource_group_name"),
  ) do
    it { should exist }
    its("name") { should cmp input("container_group_name") }
    its("resource_group") { should cmp input("resource_group_name") }
    its('location') { should cmp input("location") }
  end
end
