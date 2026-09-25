Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C111411A1C
	for <workflows@vger.kernel.org>; Fri, 25 Sep 2026 12:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790337659; cv=none; b=NPl4GMrDFMI/O1wg5tq37Mpq0V/W9V8+O5R6ovGF8/Fy89hhOL7TXMB64E0hq21Us0WIbVp/IR8CM+AB0kzzofrXdG5EB+9oPcyxvp4yoBTWYg9+1vu0VS0h4oVnqTY0jLuvHzAFYCwiNS64z5ejXxXchDfL4N/2tDRts51kT9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790337659; c=relaxed/simple;
	bh=X+p2WGLuzTjMis8lEexxPSVhvUaX7sHLToQhbMInFec=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iHUCYerlNi4Wxab5aZBP/MkLTWOh0YL+AAOjEM2CCmez5fEGNEI14RLRBVv5II4EOgKcf/MjAtFq9lDSYnoq4znJmi1tU07/2Tzkh6fDafRIuCqh9IpDfk6lMBEhiI68KVfkl91NWINpkQT189It0kFnXpAs1JjTBGozY5QrQ9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SHs4zPLQ; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SHs4zPLQ"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccd5cf02so432865a91.3
        for <workflows@vger.kernel.org>; Fri, 25 Sep 2026 05:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790337657; x=1790942457; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+1r5bHA9CuIYsqSBm/KvT0uOgABx/8PZUnr/xHf3B3A=;
        b=SHs4zPLQlMljaMesknm0j0vRyIEzOy8IpcfjfcWsAKdWbwJMFVabJgfhwydOKrUKMc
         FJcQ09Mph8KZ7N37jeTBytTNVAEKZjMd71g0tpa/JrThW/can+A9U1JwK/ARr0BEafUT
         RXf23iCFG/X7koQqejnPC8E0eG6lN/9Vib+oD0YBihbcow/nONLQJFhKrPYUMwreFrOO
         8p8esmCxN0wLdT2NWzVu3sAyUJHl332JntqMoVkOB8jH2s4zF7/1J3ZY53qYa5t63Ybj
         R6WExFvhVevY7WjYSOXDpDP8p6u9KvarCZf1V6eidUEZiIf2LKC9AbTPVUOXcU3/c1Pw
         hksQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790337657; x=1790942457;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+1r5bHA9CuIYsqSBm/KvT0uOgABx/8PZUnr/xHf3B3A=;
        b=GeGGED0M33ajXjvs534sKFucezCSE110K4iUTyBlOG6wxJFCnKDAYFohSLcwx6Sqk0
         vs09yxAdvn1P4xd05VLxq+zeezVfWrCTypF/9RBmLa0PIBklJKrdEU9YYrlAaIZ8aJ6W
         N9O5RFBWL/YP4gH82Rr0F2EXlMZC+K6RL7av7ua1wtAxpseOZjZ3688DaZh32w0dhpRW
         Y1blXLoPmUVb5Gp6TuoPG4WzPVaBhdfumXXlIc9bC6R8Jq0olEmTDDEAUUEiVz18c3E/
         WE0uvPoZksTewLmxF35e6usukGIEQGoBjgUgQ1IY7gZwjG1RJxZFXyXab/v1bv41q706
         f0BQ==
X-Forwarded-Encrypted: i=1; AKwUvBztrrQyHieWHtskDT9XY7z47zYHlbxr7ndnpR1bx4v7lwLOobaMsnf+JjrG6D0EDZbSUtbnyORL9hA=@vger.kernel.org
X-Gm-Message-State: AFuF++mPuJ40ZAKNI/Kovpbqg110gK0gV5Lro73VmsHgpB1WmRGJmwok
	aV0naudiyit8IOqLKJQVSvpula7/MAkxY2iA7f36s6gjO9dt/v1N/tYY
X-Gm-Gg: AYBFou1aQyFrFAdgaKIAql/kf6abHqXaeJro0EQmwCCcwwIQgJGd0/vo7P7X2L+IW2q
	3pwfBimxpQ9jCuAwsIj7NUrOM+5e4tBk91i9l+et6JTYPiSsyu/uDAKrFB2dIHJOjyKumLnV7wr
	AND8pvZkpDjQ1XZjR4YhIDnn71Np5ysufqForgOSx0AixSplhu5BDRK0zaB6i7/YExluwaFX99M
	03O5X6DpnZ0HJ5iNSdT4pHnEzD4TGadi52vDKexpKkZ9zK5u5WwugLrpV3vJ/wuQqz4ZdkAEq7B
	ofyFhHVnNj4Oe333Cgn3di3JhuBq+bf7M05iVzvFM7lGsShXPzdlNW3ZcYpxEeJW8+tWIOUqi+Z
	PAxfKOtN7RuX7mmrDU77gbiA/b+yw0DBdCUWW8ZWAhyWXYd4El8Dc1jTjv3JhvoaEuJn+QOrUzx
	zrhnXanUJWhDdFGb6Z2dmfIHTiU4TRoxpK94+hQaR/HHdd8my5Bwobuc11tbv0y7wO7zPjru1js
	pGMpFBBxq50BestR55P/dzq5FsfsTb++CuZJY6ixbIUJdQWIB+cmPMw8VR4Q9NglfD7gxEOajIJ
	bOjxglyUZWj9nGrlufj9Q8D8REQis0I5lgoLBIerSOwoBnsOqZYMNFTEPEmXIm+KC0aGYQ==
X-Received: by 2002:a17:90b:510a:b0:3a0:9640:802e with SMTP id 98e67ed59e1d1-3a0986ec975mr4901367a91.8.1790337651867;
        Fri, 25 Sep 2026 05:00:51 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.6.151.236])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a097663fd0sm10254338a91.9.2026.09.25.05.00.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 05:00:51 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: corbet@lwn.net
Cc: skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	tytso@mit.edu,
	krzk@kernel.org,
	maz@kernel.org,
	cassel@kernel.org,
	ebiggers@kernel.org,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] MAINTAINERS: document the branch in git T: entries
Date: Fri, 25 Sep 2026 20:00:47 +0800
Message-ID: <20260925120047.1093617-1-matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A git T: entry can name a branch after the repository URL.  The first
to do so, commit a1aa5a770dc3 ("MAINTAINERS: update hwmon subsystem
git trees"), added two T: lines for one repository, one per branch.
Today 109 of the 846 git T: lines name a branch, and ten entries list
one repository more than once with different branches.  Commit
083bf9c56d06 ("get_maintainer: add more --self-test options") taught
get_maintainer.pl to check the branch with git ls-remote.  Neither the
MAINTAINERS preamble nor submitting-patches.rst mentions any of this.

Document the syntax only.  What a named branch is for varies: many
entries name the branch linux-next merges, others a fixes or topic
branch, and some subsystems want patches based on a mainline tag rather
than on any branch of their tree.  maintainer-entry-profile.rst already
asks a profile to say which branches go into linux-next and which one
contributors should submit against, so point there.

In submitting-patches.rst, say that fixes for the current release cycle
and new development usually start from different places, and where to
find out which.

Suggested-by: Theodore Ts'o <tytso@mit.edu>
Link: https://lore.kernel.org/all/arSMwd1bGO1vrif-@mit.edu/
Signed-off-by: Matthias Goergens <matthias.goergens@gmail.com>
---
v2:
- Krzysztof: one patch instead of two.  The header no longer says when
  to name a branch (v1 tied that to the repository's HEAD); it
  documents the syntax only.  submitting-patches.rst names the branch
  that queues work for linux-next as the usual base for new
  development.  The cgit about page he mentions is a good place to
  describe branches, but not every tree has one, so the text does not
  point there.
- Marc: some trees are integration-only and want patches on a mainline
  tag, so what to base patches on is left to the P: profile or the
  maintainer:
  https://lore.kernel.org/all/875wzu4vuv.wl-maz@kernel.org/
- Niklas: fixes for the current release cycle are now told apart from
  new development.  memblock is not alone: ten entries list one
  repository with several branches, so the header says an entry may do
  that, without recommending it over a single line.
- Eric: his fsverity patch uses one T: line per branch, which the text
  allows:
  https://lore.kernel.org/all/20260925041654.112935-1-ebiggers@kernel.org/
  Pointing HEAD at the main branch with gitolite's symbolic-ref, as he
  suggested, is up to each maintainer and is not covered here:
  https://lore.kernel.org/all/20260924040030.GB5048@sol/
- Ted: documenting the branch at all was his suggestion (Link: above).

v1: https://lore.kernel.org/all/64b0be79c535bb9545f9f81a5044146a8726c761.1790220653.git.matthias.goergens@gmail.com/

 Documentation/process/submitting-patches.rst | 8 ++++++++
 MAINTAINERS                                  | 5 +++++
 2 files changed, 13 insertions(+)

diff --git a/Documentation/process/submitting-patches.rst b/Documentation/process/submitting-patches.rst
index 7ae79452e1b4..cfc72975a9d6 100644
--- a/Documentation/process/submitting-patches.rst
+++ b/Documentation/process/submitting-patches.rst
@@ -40,6 +40,14 @@ patches prepared against those trees.  See the **T:** entry for the subsystem
 in the MAINTAINERS file to find that tree, or simply ask the maintainer if
 the tree is not listed there.
 
+What to base a patch on also depends on what it is.  A fix that should reach
+mainline during the current release cycle, such as a regression fix, is
+usually based on the latest mainline or on the subsystem's fixes branch.  New
+development is usually based on the branch where the subsystem queues work for
+the next merge window, which linux-next merges and which the **T:** entry may
+name.  When in doubt, check the subsystem's **P:** profile, if there is one,
+or ask the maintainer.
+
 .. _describe_changes:
 
 Describe your changes
diff --git a/MAINTAINERS b/MAINTAINERS
index c52ec2d7d3c1..c3f8fc52f3ec 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -30,6 +30,11 @@ Descriptions of section entries and preferred order
        See Documentation/maintainer/maintainer-entry-profile.rst for details.
 	T: *SCM* tree type and location.
 	   Type is one of: git, hg, quilt, stgit, topgit
+	   A git entry may name a branch after the URL, and an entry may
+	   have several T: lines, for example one per branch.  What each
+	   branch is for, and what to base patches on, differs between
+	   subsystems: see the P: profile, if there is one, or ask the
+	   maintainer.
 	F: *Files* and directories wildcard patterns.
 	   A trailing slash includes all files and subdirectory files.
 	   F:	drivers/net/	all files in and below drivers/net

base-commit: 165768bb70265b5c38cf0b73fafd75be235f8b14
-- 
2.55.0

