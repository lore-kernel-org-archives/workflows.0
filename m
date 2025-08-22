Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C11A717BA3;
	Fri, 22 Aug 2025 08:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755851635; cv=none; b=EXiEgxSpg23rSvokoecE95eWKKuNB7NqHj5ZL1zu2aMwjRBT0BPWc0AH/4rR7RDn/iz52gjYSDOtFUu7tGyIW786+HC1gnZTosLB3kHcENM1vZNybcV2R/UIsmGjNmZtJnwJV8avDZRRNAF8JHvUW2QNr7KlW/xA8BawLeP7Iv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755851635; c=relaxed/simple;
	bh=IQizapkOutMVQ8YxAC2FWpbH2Vh9zpkINWSjPqzrkgE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Uz9/rJObdzdnttCQsmB7m8e33KDZK4aY8aTraYZU0xl6VOow3T8eNzWKBifzHRIOI/KkOoYVFP8FH0LRnbMPpxPd4y8RfpQksbAuohHMEcXt7JWwBRcGQpyWVx1e3XMTU4zL21g488ohqcrZMzgqqaDLyLat7+VfgMkF8lRAAwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Um2NNlUu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Um2NNlUu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79389C4CEF4;
	Fri, 22 Aug 2025 08:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755851635;
	bh=IQizapkOutMVQ8YxAC2FWpbH2Vh9zpkINWSjPqzrkgE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Um2NNlUuGjKH2kp9d5jtTtLwWS4/D8MUJN7dhNcr14Bz5NWwWJhaduzjkFxaXacC+
	 LqxoDYs9k7J1QfxcxXIONwBBo1YLp43+r/9XYeM/4Rql1/j15cfpWaM2TBuIajyCvu
	 rQkufU+7/gImcbr/g8tsPLJ/ARz6LYzqitliDoD0YMoQVZmxAY4GGVJa+JXskZ1zoL
	 b6MiHw1dMgWt4gcoQWERTeOwC0s923Z8ZKpCV92mH7CqggU3gWoaWKulkJVQy1968F
	 757ZOVWZemPY9PRapIGpHzEtWtBY2bqVzYsPdDLRBgHJX4pXcrtiEw5H5bwGGUOudA
	 QwjWTTtEuhyrg==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1upNDd-0000000C1V0-2eW5;
	Fri, 22 Aug 2025 10:33:53 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: 
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	workflows@vger.kernel.org
Subject: [PATCH v5 1/5] docs: maintainer-pgp-guide.rst: add a reference for kernel.org sign
Date: Fri, 22 Aug 2025 10:33:41 +0200
Message-ID: <2d8d4e6eeb3c5adbf0f34c8096d594c6bca2c82d.1755851331.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <cover.1755851331.git.mchehab+huawei@kernel.org>
References: <cover.1755851331.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

The media profile documentation will point to kernel.org sign.
Add a link to it.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/process/maintainer-pgp-guide.rst | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/process/maintainer-pgp-guide.rst b/Documentation/process/maintainer-pgp-guide.rst
index f5277993b195..795ef8d89271 100644
--- a/Documentation/process/maintainer-pgp-guide.rst
+++ b/Documentation/process/maintainer-pgp-guide.rst
@@ -903,6 +903,8 @@ the new default in GnuPG v2). To set it, add (or modify) the
 
     trust-model tofu+pgp
 
+.. _kernel_org_trust_repository:
+
 Using the kernel.org web of trust repository
 --------------------------------------------
 
-- 
2.50.1

