Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C33D53A1E65;
	Thu, 25 Dec 2025 01:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766627697; cv=none; b=s31NPI4Mf08P1hLrrb7azokCat3zv2BAp3HtZaLrTgkQ5hbslHmFXeYioumAIosF6481dYJUhdHMAOHtjkOQ3gQwSbYpF5Zb5rQD5gRRl8ZpBt+NsPGwlvnslVGcroz6kGWDdjbVYiVNkrmcKHTCyigBez3oE90BjFv4LiGXc8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766627697; c=relaxed/simple;
	bh=/+FzvKqCkQY6LY4hRpvV0WG4CYtWuVX43rT/pytBsGA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=P/R0TUia/MFPnSC7k8qlIMNT72zugGxRjAhLP1qXitinfNsPUw3RPqL+kx6r6FYYsZOaedJJtKpG3RY1mpyELTb8nHuTEGYJtdnEiH7OC15GzCHaWC1JsE/XNUgup/EbthTERsHgXcqTuiKYf1OZvnLYgQHY3Xt7LiNnXmztDT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TK3nXDdH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TK3nXDdH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 343CCC4CEF7;
	Thu, 25 Dec 2025 01:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766627697;
	bh=/+FzvKqCkQY6LY4hRpvV0WG4CYtWuVX43rT/pytBsGA=;
	h=From:To:Cc:Subject:Date:From;
	b=TK3nXDdHqQo7ZM8iKTmqJc3V1BWWUCEYy8l12R02KpIOhPYZPHtOL8E3di5Yyvus2
	 GuUsUBp3UoC8KHRh2rfrV9DQto7u4bgKwQoff2l3u3a0yyc5Wmf82mR98RQYxyrsxF
	 0MUAHGMqkVGpMHwAYWU3yobrZ1sWvwOcficcJaSBJDgT/Icc/shuuKo7qvv2gZL5+w
	 21kqst9YPhhqjqL69JyCd8u3CSKopYaeo2PSOppuwnj48M+7HkIwixCGavh5HnSgzt
	 XDz6mZAHI4na08e8T54B1p9vLiil9FLiCwuPPq+FXNKkUnnodFKB1YM4aljUcbjHu2
	 q0/zqb9zidilw==
From: SeongJae Park <sj@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: SeongJae Park <sj@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	workflows@vger.kernel.org
Subject: [PATCH] docs: submitting-patches: suggest adding previous version links
Date: Wed, 24 Dec 2025 17:54:45 -0800
Message-ID: <20251225015447.16387-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For review of patches that revisioned multiple times, patch changelogs
are very useful.  Adding actual links to the previous versions can
further help the review.  Using such links, reviewers can double check
the changelog by themselves, and find previous discussions.  Nowadays
having such links (e.g., lore.kernel.org archive links) is easy and
reliable.  Suggest adding such links if available.

Signed-off-by: SeongJae Park <sj@kernel.org>
---
 Documentation/process/submitting-patches.rst | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/process/submitting-patches.rst b/Documentation/process/submitting-patches.rst
index 9a509f1a6873..e69d19ad658f 100644
--- a/Documentation/process/submitting-patches.rst
+++ b/Documentation/process/submitting-patches.rst
@@ -805,7 +805,8 @@ not part of the changelog which gets committed to the git tree. It is
 additional information for the reviewers. If it's placed above the
 commit tags, it needs manual interaction to remove it. If it is below
 the separator line, it gets automatically stripped off when applying the
-patch::
+patch.  If available, adding links to previous versions of the patch (e.g.,
+lore.kernel.org archive link) is recommended to help reviewers::
 
   <commit message>
   ...
@@ -814,6 +815,9 @@ patch::
   V2 -> V3: Removed redundant helper function
   V1 -> V2: Cleaned up coding style and addressed review comments
 
+  v2: https://lore.kernel.org/bar
+  v1: https://lore.kernel.org/foo
+
   path/to/file | 5+++--
   ...
 

base-commit: 7f3c3a0a9103dc92c823f27db3284ac2914e7558
-- 
2.47.3
