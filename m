Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4718288D1;
	Tue, 23 Jul 2024 22:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721773988; cv=none; b=UxWVZU3qN/fAVVXVkNmshJyn58dTOD9+3LGFy32FaAgvEh5VRaj68dNStR58+NR+0F5pzN0rB2C2TstazlClf7BrKjmLWSYgVnVGAFv3fOh2mkS840kttwPXZqo+JjJ/U1HrKVk8p0XeaMCd80mKIGeBy77NjlOk2cUqSpJXspw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721773988; c=relaxed/simple;
	bh=vQ8QChVbCGudFmgWWt02+qhBkuPKXl8FjJKRh23Iyxw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZL+lP+8DLblDgexEFfv4OQ36CcwfLu5SsGPpv1wHWl87hjSF2MF1ZX/PkQd7aETOmGokvnvBU3XgIu8xVbHXxJm5Oqy87/NLL2mJ4QVBhsRWkriMXjf1YHWNNnjv/YRXZpfN18ImPqLqQiAdK0xE5Q3do53Y8NML3aEFhjkEnhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AibqL6Rm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AibqL6Rm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC203C4AF09;
	Tue, 23 Jul 2024 22:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721773988;
	bh=vQ8QChVbCGudFmgWWt02+qhBkuPKXl8FjJKRh23Iyxw=;
	h=From:To:Cc:Subject:Date:From;
	b=AibqL6RmqX1HXHNSo4+n7HB6EJhl+5/dkusooYcomN79JlZOk2gB8FEklkSsJd3xL
	 15mKqx71Stj2hAv54KsYfBP4a/E7c+VkqSFSs1Q1eEJBLgKUXcybaCiEKdfmuacCF+
	 MyvNVR+oo9NjpawR/nPu6/BTneUyqNGSg+LFSQ9C42whr/kso6PtTnmpKoOmQICLKw
	 Kh2FRlBDzv7lATSW2rhkhq9cYBBKnnK3O+ySNXZeXR8YMDoqGZkmcwkUgByjqDvg2O
	 6l4+ifNh5PxA9wNZkevUVzdQ8+1mEF9Uj6iG56t70lOOsNsU32z6zCCEHIpc+g9vpx
	 E3RIbnAcwGDUA==
From: Jakub Kicinski <kuba@kernel.org>
To: corbet@lwn.net
Cc: workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Jakub Kicinski <kuba@kernel.org>,
	Kees Cook <kees@kernel.org>
Subject: [PATCH v2] MAINTAINERS: add Documentation/dev-tools/ to workflows@
Date: Tue, 23 Jul 2024 15:32:58 -0700
Message-ID: <20240723223258.2197852-1-kuba@kernel.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The goal of the workflows@ mailing list was to make it easier for
maintainers who don't use lore+lei to subscribe to topics related
to process changes. In other words it should cover changes to Documentation
files which most maintainers should know about. Recent changes from Kees [1]
to provide guidelines on naming KUnit files did not fall under workflows@
since Documentation/dev-tools/ isn't covered. The patch volume for
dev-tools isn't huge and most of the changes are interesting. Add it.

Link: https://lore.kernel.org/20240720165441.it.320-kees@kernel.org/ # [1]
Signed-off-by: Jakub Kicinski <kuba@kernel.org>
Reviewed-by: Kees Cook <kees@kernel.org>
---
v2:
 - s/workloads/workflows/
v1: https://lore.kernel.org/all/20240722142913.1709594-1-kuba@kernel.org/
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index ec6904cbfd1f..a85234de4fd0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6680,6 +6680,7 @@ DOCUMENTATION PROCESS
 M:	Jonathan Corbet <corbet@lwn.net>
 L:	workflows@vger.kernel.org
 S:	Maintained
+F:	Documentation/dev-tools/
 F:	Documentation/maintainer/
 F:	Documentation/process/
 
-- 
2.45.2

