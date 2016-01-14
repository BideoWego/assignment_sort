require 'spec_helper'

describe 'sorting functions' do
	let(:a) { Array.new(1*rand(1..100)) { |i| 1*rand(-10000..10000) } }
	let(:sorted) { a.dup.sort }

	# let(:a) { [-5,-4,-3,-2,-1,0,1,2,3,4,5].shuffle }
	# let(:sorted) { a.dup.sort }

	context "given an unsorted array of integers" do
		describe '#bubble_sort' do
			it "returns the array sorted" do
				expect(bubble_sort(a)).to eq(sorted)
			end
		end

		describe '#select_sort' do
			it "returns the array sorted" do
				expect(select_sort(a)).to eq(sorted)
			end
		end

		describe '#insert_sort' do
			it "returns the array sorted" do
				expect(insert_sort(a)).to eq(sorted)
			end
		end

		describe '#merge_sort' do
			it "returns the array sorted" do
				expect(merge_sort(a)).to eq(sorted)
			end
		end

		describe '#quick_sort' do
			it "returns the array sorted" do
				expect(quick_sort(a)).to eq(sorted)
			end
		end

		describe '#count_sort' do
			it "returns the array sorted" do
				expect(count_sort(a)).to eq(sorted)
			end
		end

		describe '#radix_sort' do
			it "returns the array sorted" do
				expect(radix_sort(a)).to eq(sorted)
			end
		end
	end
end