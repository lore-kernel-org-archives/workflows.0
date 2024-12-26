Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1148D450F2;
	Thu, 26 Dec 2024 22:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735250813; cv=none; b=i6hKT7B1yHZuFsTDvef8Dsd7/4eGZJPDZQ7POqSlyFjCGbXQigwccgA62h1ZTrvcXTth0sDLKOs21KRAnTDaxLkZCtMYxg9Bc2c47eoVHjvjuSd90Q+a7lIbscMwbdM7ScM7g7Bzi4y461GqGdQvCoFTyRet4Ksi3BJHI2Enldo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735250813; c=relaxed/simple;
	bh=W6NkvEY01XJjhE9GSvPS7ecCqMC4G+APXNvVLobmY2s=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=awHQ99YjnSkS5+TtlmELxtiGmbW56zncbm6wxg2EKX06yWxT51n/XIRHckrfkNwgY7hxI3uL5iLj7GJIK6k47U9o/aZknEqwrF9o67eXL6ww3b+qz+hu7MWaZTQppcWhkVcq/CtynxX7ETErOTub3hJs29Vm1fxVXPKk1VZ8hVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nb5bL5yU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nb5bL5yU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84373C4CED1;
	Thu, 26 Dec 2024 22:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735250812;
	bh=W6NkvEY01XJjhE9GSvPS7ecCqMC4G+APXNvVLobmY2s=;
	h=From:To:Cc:Subject:Date:From;
	b=Nb5bL5yU5vxbWZeChDwldJE3rlpbO1YoHeVFEZ+L8R5e9mXpUoUXpspvNPg4dwHqU
	 ibZAJv7o5A1sRF7gX48VePwCb2RusC6XxkqB4QP+AeebcW5m3DDY81unpLxM+zK2zH
	 YVcsFzKU8Q/5hDgo1rnkFhZyj87TSrFoyF7mjeqAN/7/zd1adWKDmz1SJeHUiU/AO1
	 xjz5Zo4B8Mcd0CGwhizLtGPhlekh4h+D+Xk29Lj+aivx2/xXDwwdcRihN5bKB98SAz
	 zxcQIgu5DYlCyRJGv2ERbUcBDPzieWPKIZ+IDlH8Rt8NT8bQ4HhWmSlar2YjT2ardN
	 PgEHaHbV20hUQ==
From: Sasha Levin <sashal@kernel.org>
To: torvalds@linux-foundation.org
Cc: apw@canonical.com,
	conor@kernel.org,
	corbet@lwn.net,
	dwaipayanray1@gmail.com,
	geert+renesas@glider.be,
	gitster@pobox.com,
	horms@kernel.org,
	joe@perches.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@leemhuis.info,
	lukas.bulwahn@gmail.com,
	miguel.ojeda.sandonis@gmail.com,
	niklas.soderlund@corigine.com,
	willy@infradead.org,
	workflows@vger.kernel.org,
	kees@kernel.org,
	Sasha Levin <sashal@kernel.org>
Subject: [PATCH] git-disambiguate: disambiguate shorthand git ids
Date: Thu, 26 Dec 2024 17:05:55 -0500
Message-Id: <20241226220555.3540872-1-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sometimes long commit hashes can be ambiguous even when providing
several digits from its abbreviation.

Add a script that resolves such ambiguity by also considering the
commit subject line.

This also allows users to use shorter commit ID prefixes than normally
required, since we can correctly identify the intended commit using the
subject line as additional context.

In force mode (--force), you can even omit a valid commit ID prefix
entirely - the script will try to find a commit matching just the
subject line.

Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 scripts/git-disambiguate.sh | 199 ++++++++++++++++++++++++++++++++++++
 1 file changed, 199 insertions(+)
 create mode 100755 scripts/git-disambiguate.sh

diff --git a/scripts/git-disambiguate.sh b/scripts/git-disambiguate.sh
new file mode 100755
index 000000000000..db73671d2665
--- /dev/null
+++ b/scripts/git-disambiguate.sh
@@ -0,0 +1,199 @@
+#!/bin/bash
+
+usage() {
+	echo "Usage: $(basename "$0") [--selftest] [--force] <commit-id> [commit-subject]"
+	echo "Disambiguates a short git commit ID to its full SHA-1 hash."
+	echo ""
+	echo "Arguments:"
+	echo "  --selftest	  Run self-tests"
+	echo "  --force		 Try to find commit by subject if ID lookup fails"
+	echo "  commit-id	   Short git commit ID to disambiguate"
+	echo "  commit-subject  Optional commit subject to help disambiguate between multiple matches"
+	exit 1
+}
+
+# Convert subject with ellipsis to grep pattern
+convert_to_grep_pattern() {
+	local subject="$1"
+	# First escape ALL regex special characters
+	local escaped_subject
+	escaped_subject=$(printf '%s\n' "$subject" | sed 's/[[\.*^$()+?{}|]/\\&/g')
+	# Also escape colons, parentheses, and hyphens as they are special in our context
+	escaped_subject=$(echo "$escaped_subject" | sed 's/[:-]/\\&/g')
+	# Then convert escaped ... sequence to .*?
+	escaped_subject=$(echo "$escaped_subject" | sed 's/\\\.\\\.\\\./.*?/g')
+	echo "^${escaped_subject}$"
+}
+
+git_full_id() {
+	local force=0
+	if [ "$1" = "--force" ]; then
+		force=1
+		shift
+	fi
+
+	# Split input into commit ID and subject
+	local input="$*"
+	local commit_id="${input%% *}"
+	local subject=""
+
+	# Extract subject if present (everything after the first space)
+	if [[ "$input" == *" "* ]]; then
+		subject="${input#* }"
+		# Strip the ("...") quotes if present
+		subject="${subject#*(\"}"
+		subject="${subject%\")*}"
+	fi
+
+	# Get all possible matching commit IDs
+	local matches
+	readarray -t matches < <(git rev-parse --disambiguate="$commit_id" 2>/dev/null)
+
+	# Return immediately if we have exactly one match
+	if [ ${#matches[@]} -eq 1 ]; then
+		echo "${matches[0]}"
+		return 0
+	fi
+
+	# If no matches and not in force mode, return failure
+	if [ ${#matches[@]} -eq 0 ] && [ $force -eq 0 ]; then
+		return 1
+	fi
+
+	# If we have a subject, try to find a match with that subject
+	if [ -n "$subject" ]; then
+		# Convert subject with possible ellipsis to grep pattern
+		local grep_pattern
+		grep_pattern=$(convert_to_grep_pattern "$subject")
+
+		# In force mode with no ID matches, use git log --grep directly
+		if [ ${#matches[@]} -eq 0 ] && [ $force -eq 1 ]; then
+			# Use git log to search, but filter to ensure subject matches exactly
+			local match
+			match=$(git log --format="%H %s" --grep="$grep_pattern" --perl-regexp -10 | \
+					while read -r hash subject; do
+						if echo "$subject" | grep -qP "$grep_pattern"; then
+							echo "$hash"
+							break
+						fi
+					done)
+			if [ -n "$match" ]; then
+				echo "$match"
+				return 0
+			fi
+		else
+			# Normal subject matching for existing matches
+			for match in "${matches[@]}"; do
+				if git log -1 --format="%s" "$match" | grep -qP "$grep_pattern"; then
+					echo "$match"
+					return 0
+				fi
+			done
+		fi
+	fi
+
+	# No match found
+	return 1
+}
+
+run_selftest() {
+	local test_cases=(
+		'00250b5 ("MAINTAINERS: add new Rockchip SoC list")'
+		'0037727 ("KVM: selftests: Convert xen_shinfo_test away from VCPU_ID")'
+		'ffef737 ("net/tls: Fix skb memory leak when running kTLS traffic")'
+		'd3d7 ("cifs: Improve guard for excluding $LXDEV xattr")'
+		'dbef ("Rename .data.once to .data..once to fix resetting WARN*_ONCE")'
+		'12345678'  # Non-existent commit
+		'12345 ("I'\''m a dummy commit")'  # Valid prefix but wrong subject
+		'--force 99999999 ("net/tls: Fix skb memory leak when running kTLS traffic")'  # Force mode with non-existent ID but valid subject
+		'83be ("firmware: ... auto-update: fix poll_complete() ... errors")'  # Wildcard test
+		'--force 999999999999 ("firmware: ... auto-update: fix poll_complete() ... errors")'  # Force mode wildcard test
+	)
+
+	local expected=(
+		"00250b529313d6262bb0ebbd6bdf0a88c809f6f0"
+		"0037727b3989c3fe1929c89a9a1dfe289ad86f58"
+		"ffef737fd0372ca462b5be3e7a592a8929a82752"
+		"d3d797e326533794c3f707ce1761da7a8895458c"
+		"dbefa1f31a91670c9e7dac9b559625336206466f"
+		""  # Expect empty output for non-existent commit
+		""  # Expect empty output for wrong subject
+		"ffef737fd0372ca462b5be3e7a592a8929a82752"  # Should find commit by subject in force mode
+		"83beece5aff75879bdfc6df8ba84ea88fd93050e"  # Wildcard test
+		"83beece5aff75879bdfc6df8ba84ea88fd93050e"  # Force mode wildcard test
+	)
+
+	local expected_exit_codes=(
+		0
+		0
+		0
+		0
+		0
+		1  # Expect failure for non-existent commit
+		1  # Expect failure for wrong subject
+		0  # Should succeed in force mode
+		0  # Should succeed with wildcard
+		0  # Should succeed with force mode and wildcard
+	)
+
+	local failed=0
+
+	echo "Running self-tests..."
+	for i in "${!test_cases[@]}"; do
+		# Capture both output and exit code
+		local result
+		result=$(git_full_id ${test_cases[$i]})  # Removed quotes to allow --force to be parsed
+		local exit_code=$?
+
+		# Check both output and exit code
+		if [ "$result" != "${expected[$i]}" ] || [ $exit_code != ${expected_exit_codes[$i]} ]; then
+			echo "Test case $((i+1)) FAILED"
+			echo "Input: ${test_cases[$i]}"
+			echo "Expected output: '${expected[$i]}'"
+			echo "Got output: '$result'"
+			echo "Expected exit code: ${expected_exit_codes[$i]}"
+			echo "Got exit code: $exit_code"
+			failed=1
+		else
+			echo "Test case $((i+1)) PASSED"
+		fi
+	done
+
+	if [ $failed -eq 0 ]; then
+		echo "All tests passed!"
+		exit 0
+	else
+		echo "Some tests failed!"
+		exit 1
+	fi
+}
+
+# Check for selftest
+if [ "$1" = "--selftest" ]; then
+	run_selftest
+	exit $?
+fi
+
+# Handle --force flag
+force=""
+if [ "$1" = "--force" ]; then
+	force="--force"
+	shift
+fi
+
+# Verify arguments
+if [ $# -eq 0 ]; then
+	usage
+fi
+
+# Skip validation in force mode
+if [ -z "$force" ]; then
+	# Validate that the first argument matches at least one git commit
+	if [ $(git rev-parse --disambiguate="$1" 2>/dev/null | wc -l) -eq 0 ]; then
+		echo "Error: '$1' does not match any git commit"
+		exit 1
+	fi
+fi
+
+git_full_id $force "$@"
+exit $?
-- 
2.39.5

