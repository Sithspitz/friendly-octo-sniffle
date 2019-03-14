# Chi-Squared Comparison of RORC amplifications by mutational subgroup #
# Script adopted from the verbose-invention repo


# Comparison 1: all WT vs KRAS MT Only #
# Import, Compare, Print, Export
kras_test <- read.csv("./friendly-octo-sniffle/chi_sq_rorc_amp/raw_input/kras_chi.csv",
                      row.names=1)
kras_test_chi <- chisq.test(kras_test, correct = T)
kras_test_chi
kras_test_chi <- as.data.frame(as.character(kras_test_chi))
write.table(kras_test_chi, file = "./friendly-octo-sniffle/chi_sq_rorc_amp/output/kras_mut_chi_sq.txt")


# Comparison 2: all WT vs STK11 MT Only #
# Import, Compare, Print, Export
stk11_test <- read.csv("./friendly-octo-sniffle/chi_sq_rorc_amp/raw_input/stk11_chi.csv",
                      row.names=1)
stk11_test_chi <- chisq.test(stk11_test, correct = T)
stk11_test_chi
stk11_test_chi <- as.data.frame(as.character(stk11_test_chi))
write.table(stk11_test_chi, file = "./friendly-octo-sniffle/chi_sq_rorc_amp/output/stk11_mut_chi_sq.txt")
stk11_test_fisher <- fisher.test(stk11_test)
stk11_test_fisher
stk11_test_fisher <- as.data.frame(as.character(stk11_test_fisher))
write.table(stk11_test_fisher, file = "./friendly-octo-sniffle/chi_sq_rorc_amp/output/stk11_mut_fisher.txt")


# Comparison 3: all WT vs KRAS/STK11 MT #
# Import, Compare, Print, Export
kras_stk11_test <- read.csv("./friendly-octo-sniffle/chi_sq_rorc_amp/raw_input/kras_stk11_chi.csv",
                       row.names=1)
kras_stk11_test_chi <- chisq.test(kras_stk11_test, correct = T)
kras_stk11_test_chi
kras_stk11_test_chi <- as.data.frame(as.character(kras_stk11_test_chi))
write.table(kras_stk11_test_chi, file = "./friendly-octo-sniffle/chi_sq_rorc_amp/output/kras_stk11_mut_chi_sq.txt")
kras_stk11_test_fisher <- fisher.test(kras_stk11_test)
kras_stk11_test_fisher
kras_stk11_test_fisher <- as.data.frame(as.character(kras_stk11_test_fisher))
write.table(kras_stk11_test_fisher, file = "./friendly-octo-sniffle/chi_sq_rorc_amp/output/kras_stk11_mut_fisher.txt")

