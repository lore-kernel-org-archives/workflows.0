Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C09D25A65C;
	Mon,  3 Feb 2025 17:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738604788; cv=none; b=fwTBGvRik+zeFkZC/gbSHuq8VNTpiDroZfN8vK4pj1lNQlnAbidQJMcUiMzJK88ca7KdBlDKmASqn9bT+j42m2ngx3Rprv8/VspPDKJCdPM9HJG72oxJkM9LV63XP4oY1MSXtgXmKcu+lSYgInOuM8HGXVeRmHPCB0MDbsfvgZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738604788; c=relaxed/simple;
	bh=WgogWYyf8sjEHMTgsIKgfHiy5oLcV3jzWXMZvrx3hk0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=a90A4pc21maGVGuAVmDNQXWDbL9R0MZyiGa+NzEQPJQxphIjQN+zS78lDfez6bMpJ/xx2bET4XIPSorU8rkEXXzAu74n6BF1y/8M36xACbdIOeGhCF+zKnaYMwj9RFUQoPaLFX8a9qLKNkawloaX1HNyDpYZEfbwKd57TdelfsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hPss2DeD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hPss2DeD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAA6AC4CEE2;
	Mon,  3 Feb 2025 17:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738604788;
	bh=WgogWYyf8sjEHMTgsIKgfHiy5oLcV3jzWXMZvrx3hk0=;
	h=From:To:Cc:Subject:Date:From;
	b=hPss2DeDw1c7gdNABQnrGwcg9kocyuk4oQ31MGzIfGZ6YRw6zAhE91Wd9ruNydx5v
	 C+oFayt3aYfs7ajpftuo7HWGuwrGErBFSxhaWzhhAn686oYOfENoGveFT8pGahJLiR
	 /hjyNo6yHTZgHOUEU/etDf/NjGqpV2ooaLBwzQtM9eVSLtmn88G7AJtmo9HBsQ+6Dj
	 Y4K0e0GcGHuxX6WndPTnz74w72O0N7FAZBsHmcaVkWoNUGTfMQG9Bh7oL7SHMwOage
	 f2WIIOkerUbJY0+yPvuCjoP22TAOlg8/fL/YNivbhX0+DQT/PCivCY6rqeA7cnSQZF
	 1vZUHYETsxUWg==
From: Jakub Kicinski <kuba@kernel.org>
To: corbet@lwn.net
Cc: Jakub Kicinski <kuba@kernel.org>,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH] docs: submitting-patches: document the format for affiliation
Date: Mon,  3 Feb 2025 09:46:25 -0800
Message-ID: <20250203174626.1131225-1-kuba@kernel.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adding company name in round brackets to From/SoB lines
is fairly common, but I don't see it documented anywhere.
Every now and then people try to add the sponsorship lines
to the commit message, fun example from this merge window:

  Sponsored by:   The FreeBSD Foundation

from commit 2ce67f8bf1ce ("wifi: iwlwifi: mvm: fix iwl_ssid_exist()
check"). Better format would be:

  Author: Miri Korenblit (FreeBSD Foundation) <...

Signed-off-by: Jakub Kicinski <kuba@kernel.org>
---
CC: corbet@lwn.net
CC: workflows@vger.kernel.org
CC: linux-doc@vger.kernel.org
---
 Documentation/process/submitting-patches.rst | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/process/submitting-patches.rst b/Documentation/process/submitting-patches.rst
index 8fdc0ef3e604..12ed28b3d113 100644
--- a/Documentation/process/submitting-patches.rst
+++ b/Documentation/process/submitting-patches.rst
@@ -717,6 +717,12 @@ patch in the permanent changelog.  If the ``from`` line is missing,
 then the ``From:`` line from the email header will be used to determine
 the patch author in the changelog.
 
+The author may indicate their affiliation or the sponsor of the work
+by adding the name of an organization to the ``from`` and ``SoB`` lines,
+e.g.:
+
+	From: Patch Author (Company) <author@example.com>
+
 Explanation Body
 ^^^^^^^^^^^^^^^^
 
-- 
2.48.1

