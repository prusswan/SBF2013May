class Estate < ActiveRecord::Base
  has_many :blocks, -> { order(:no) }
  has_many :units, -> { order(:no) }, through: :blocks


  rails_admin do
    # Found associations:

    configure :blocks, :has_many_association
    configure :units, :has_many_association

    # Found columns:

    configure :id, :integer
    configure :name, :string
    configure :total, :integer
    configure :created_at, :datetime
    configure :updated_at, :datetime

    # Cross-section configuration:

    # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
    # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
    # label_plural 'My models'      # Same, plural
    # weight 0                      # Navigation priority. Bigger is higher.
    # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
    # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

    # Section specific configuration:

    list do
      # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
      # items_per_page 100    # Override default_items_per_page
      sort_by :name           # Sort column (default is primary key)
      # sort_reverse true     # Sort direction (default is true for primary key, last created first)

      field :name
      field :total
      field :blocks
    end

    # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
    # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
    # using `field` instead of `configure` will exclude all other fields and force the ordering
  end
end
