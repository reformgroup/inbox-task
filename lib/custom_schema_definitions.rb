module Ddb
  module Userstamp #:nodoc:
    module MigrationHelper
      
      # Adds a deleted_at column when timestamps is called from a migration.
      def timestamps(options = {})
        include_deleted_at = options.delete(:include_deleted_at)
        super(options)
        column(:deleted_at, :datetime) if include_deleted_at
      end
      
      # Adds a creator_id, updater_id and [deleter_id] columns when userstamps is called from a migration.
      def userstamps(options = {})
        include_deleter_id = options.delete(:include_deleter_id)
        
        references(:creator, options.merge(foreign_key: { column: :creator_id }))
        references(:updater, options.merge(foreign_key: { column: :updater_id }))
        references(:deleter, options.merge(foreign_key: { column: :deleter_id })) if include_deleter_id
      end
    end
  end
end

ActiveRecord::ConnectionAdapters::TableDefinition.send(:prepend, Ddb::Userstamp::MigrationHelper)

# module ActiveRecord
#   module ConnectionAdapters #:nodoc:
#     class TableDefinition
#
#       # Adds a deleted_at column when timestamps is called from a migration.
#       def timestamps(options = {})
#         include_deleted_at = options.delete(:include_deleted_at)
#         super(options)
#         column(:deleted_at, :datetime) if include_deleted_at
#       end
#
#       # Adds a creator_id, updater_id and [deleter_id] columns when userstamps is called from a migration.
#       def userstamps(options = {})
#         include_deleter_id = options.delete(:include_deleter_id)
#
#         references(:creator, options.merge(foreign_key: { column: :creator_id }))
#         references(:updater, options.merge(foreign_key: { column: :updater_id }))
#         references(:deleter, options.merge(foreign_key: { column: :deleter_id })) if include_deleter_id
#       end
#     end
#   end
# end
#
# module Ddb
#   module Userstamp
#     module MigrationHelper
#       def self.included(base) # :nodoc:
#         base.send(:include, InstanceMethods)
#       end
#
#       module InstanceMethods
#         def userstamps(include_deleted_by = false)
#           column(Ddb::Userstamp.compatibility_mode ? :created_by : :creator_id, :integer)
#           column(Ddb::Userstamp.compatibility_mode ? :updated_by : :updater_id, :integer)
#           column(Ddb::Userstamp.compatibility_mode ? :deleted_by : :deleter_id, :integer) if include_deleted_by
#         end
#       end
#     end
#   end
# end
#
# ActiveRecord::ConnectionAdapters::Table.send(:include, Ddb::Userstamp::MigrationHelper)