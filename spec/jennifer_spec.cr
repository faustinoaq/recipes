require "./recipes_spec"

describe "Jennifer Reciper" do
  it "compiles and tests jennifer recipe with Slang templates" do
    generate_app(recipe: "jennifer", template: "slang", model: "jennifer").should be_true
    build_app.should be_true
    test_app.should be_true
  ensure
    cleanup
  end

  it "compiles and tests jennifer recipe with ECR templates" do
    generate_app(recipe: "jennifer", template: "ecr", model: "jennifer").should be_true
    build_app.should be_true
    test_app.should be_true
  ensure
    cleanup
  end
end
