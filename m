Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA58035956;
	Wed, 18 Dec 2024 23:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734564997; cv=none; b=PmouoYug8EOIWWsKH4AQxP6Tj7XHqFXutX/JXI9ESl6b/KhBQ+pGfhMX36sWY6ZK84EI0GYR3nGGPjDtWJUfik1/DKSelWQvw0hbsYqLhGpIEBHbq2tbSgsADfsRctqXKx0L3XpeDoCu8ncRBQWCmMplyhIUpdXyh75y65uZwyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734564997; c=relaxed/simple;
	bh=zBI3FaL6zIRdIHdBt5nTkhdL7dh2m7MZsR0WBVjYNhs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nlJjgfEqxrGF5fgpnbN+BOoe/OSQeSx+FPTFEgzP2xjQvucrL78+CHfHcTKkUn2AZl1XVCUJeIz4qlur1GjdhAIuGMgM8+Ct2qbVa+Hu7KRDUx80RE7Gp8BcphFA/nBg5vaLPNbdO7RJzIpg4BIsnaMS6u74OVQHIQTvc1mohiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U1IAPvu2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U1IAPvu2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F7E6C4CECD;
	Wed, 18 Dec 2024 23:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734564997;
	bh=zBI3FaL6zIRdIHdBt5nTkhdL7dh2m7MZsR0WBVjYNhs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=U1IAPvu2abOxV3XX1UP+HFcDbm/zHErp4nhzBGACK/6X3MSU+KuNv1WVaMN4puWwz
	 OsTCo7u9YpKw6fVo6hbTcJ7ddyGTxMySzAG5LPAZMPwVWW3viC+oqjltAqRYpCxaJy
	 d42FbZpjqcXsVagNq7h96aH9/NGqob3/vsmJaBSoBuGQx7iK/eNhEdF8hZCMk/OUvF
	 6PnMxWE+WzxJOiKgfS/HILExKQalnNZD/8HgrsFAjQ+vNEBmaJg79KjIfWf1572Fl8
	 f4tlnsoCaYjGL9N20R3z1jXTQSLTMSvpnDzcd8T8LvsHF1I4hzsCN9nOAZ1So2/7Ma
	 dwEFdnQWEB1xg==
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
	workflows@vger.kernel.org,
	Sasha Levin <sashal@kernel.org>
Subject: [RFC] git-disambiguate: disambiguate shorthand git ids
Date: Wed, 18 Dec 2024 18:36:13 -0500
Message-Id: <20241218233613.219345-1-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <CAHk-=wiwAz3UgPOWK3RdGXDnTRHcwVbxpuxCQt_0SoAJC-oGXQ@mail.gmail.com>
References: <CAHk-=wiwAz3UgPOWK3RdGXDnTRHcwVbxpuxCQt_0SoAJC-oGXQ@mail.gmail.com>
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
 scripts/git-disambiguate.sh | 163 ++++++++++++++++++++++++++++++++++++
 1 file changed, 163 insertions(+)
 create mode 100755 scripts/git-disambiguate.sh

diff --git a/scripts/git-disambiguate.sh b/scripts/git-disambiguate.sh
new file mode 100755
index 000000000000..86063dd0fd2c
--- /dev/null
+++ b/scripts/git-disambiguate.sh
@@ -0,0 +1,163 @@
+#!/bin/bash
+
+usage() {
+	echo "Usage: $(basename "$0") [--selftest] [--force] <commit-id> [commit-subject]"
+	echo "Disambiguates a short git commit ID to its full SHA-1 hash."
+	echo ""
+	echo "Arguments:"
+	echo "  --selftest	  Run self-tests"
+	echo "  --force		Try to find commit by subject if ID lookup fails"
+	echo "  commit-id	   Short git commit ID to disambiguate"
+	echo "  commit-subject  Optional commit subject to help disambiguate between multiple matches"
+	exit 1
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
+		# In force mode, search all commits if no ID matches found
+		if [ ${#matches[@]} -eq 0 ]; then
+			local match
+			match=$(git log --format="%H %s" --grep="$subject" --fixed-strings | grep -F -m 1 " $subject" | cut -d' ' -f1)
+			if [ -n "$match" ]; then
+				echo "$match"
+				return 0
+			fi
+		else
+			# Normal subject matching for existing matches
+			for match in "${matches[@]}"; do
+				if [ "$(git log -1 --format="%s" "$match")" = "$subject" ]; then
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
+		'12345678'  # Non-existent commit
+		'12345 ("I'\''m a dummy commit")'  # Valid prefix but wrong subject
+		'--force 99999999 ("net/tls: Fix skb memory leak when running kTLS traffic")'  # Force mode with non-existent ID but valid subject
+	)
+	
+	local expected=(
+		"00250b529313d6262bb0ebbd6bdf0a88c809f6f0"
+		"0037727b3989c3fe1929c89a9a1dfe289ad86f58"
+		"ffef737fd0372ca462b5be3e7a592a8929a82752"
+		""  # Expect empty output for non-existent commit
+		""  # Expect empty output for wrong subject
+		"ffef737fd0372ca462b5be3e7a592a8929a82752"  # Should find commit by subject in force mode
+	)
+	
+	local expected_exit_codes=(
+		0
+		0
+		0
+		1  # Expect failure for non-existent commit
+		1  # Expect failure for wrong subject
+		0  # Should succeed in force mode
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

