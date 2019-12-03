# frozen_string_literal: true

Card.delete_all

Rake::Task['cards:parsing'].invoke
