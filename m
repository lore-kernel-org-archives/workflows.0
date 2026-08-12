Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD887421EF8;
	Wed, 12 Aug 2026 12:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786537297; cv=none; b=jT3Fi0FdjasvTbSmPtA8/eEREiAjyZwGydzN8fdulf9mJo+OSPQaJu50o5NUTKIUAsY0IdRGXsvycgWJo8XYtFcwy41LwJzvp4Au8rTg7G8DqMh2bqZ6U8uc7h13Ht3TEXuNDq+oOKN5THdtrlokNCoJtU4zjQsVCsYSAa0riYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786537297; c=relaxed/simple;
	bh=QsqmGJjAs3LBDCICahssYqP5hqzT6lLSgOzvjJ1EllM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=apKBs6A8o1VMosnACHUMCiVn23oUnmVcM7QKGNxHRqrcDRK0bF6JQx0zEyhw/30ExQ/WL+hzBReejlLlWQJpDrJeFrij23e/CQpURmPIQZh9wvuq1EV93ndjEdMRltLm3mbiqCLvWQjwx3QcrvrJuphIzlISZ0r7KPh57p36IsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=H7lZXJnx; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=SKB0/H69; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="H7lZXJnx";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="SKB0/H69"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4hKnfH4RFszMlK5;
	Wed, 12 Aug 2026 14:21:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1786537287;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TzXib7h8+DU4Hvoo8t69XR/+6xQia1SBDCQrsA4lVqM=;
	b=H7lZXJnxMpweErwwk1tNotj7C/pwXeE+Ma3CSVGl1Imal7IeHahDItkNeU5RiVIOXO7kw1
	19y5PvUYEKoRx1GYeWonBjiX2W+WkakUsjspfPNeLUdMUX7M+k5dfr9NZ91eNk+97AAs1M
	yHgWIX5LOJ2mBnAdx/3M/jBS/qoeeLt6zrrWPWDjYNDVyMTuuX0Zac6gp2hL0lzI/VLf9q
	Q5f+zdPASpvpAYRsvjogwhc5z370lAD33mXsI92bfK80OL9CuDDJYCoTZOOrT3sJPD8uA7
	rrrn6nYcs9xuQ93tQpl3dbLI27ExNMQEhe+eJ6BVbcPB1OoddDspwRHanuMpEA==
From: Manuel Ebner <manuelebnerli@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1786537286;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TzXib7h8+DU4Hvoo8t69XR/+6xQia1SBDCQrsA4lVqM=;
	b=SKB0/H69+i/2ceHCglvAYm6ohT/1r1sBf53rEbsb9zsm94vck7rFjrWtAI7yUmCQNtGOG4
	8boP2ZBmXEw/ig9iRImIratvXJNUZGD+32s0hw0jlEcseRqlyNNlPQO6f13zMDcSEwnpTJ
	LwJrybCrYm+ymwsKp1n1RgfQDyn0oo+uiRwhDFH1IVwuPUAC3rHyQXMnCfnQepc4OsG+QB
	hHr7UMynn1QouP39vz/fpU8AgfCfzQX7gGh273tflsegSiQhdQ23gS+EZomRu8jYNmxeX6
	2IviXziboF7fo9Cw/G/M54afTEP1LgbPb8+d6EgHqGGA0gVWg/OzLpnQdIKdvw==
To: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Cc: Manuel Ebner <manuelebnerli@mailbox.org>,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/5] Docs: software-requirements.rst: Refine language
Date: Wed, 12 Aug 2026 14:19:41 +0200
Message-ID: <20260812121945.1635085-2-manuelebnerli@mailbox.org>
In-Reply-To: <20260812120805.1631430-3-manuelebnerli@mailbox.org>
References: <20260812120805.1631430-3-manuelebnerli@mailbox.org>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: esituzz6frfcyw6kuexkxxmrnpop1j54
X-MBO-RS-ID: 11b681d69078820e894

This document grew over the years and isn't limited to compiling or running
the kernel anymore.

compile -> interact
levels -> versions
run the current kernel version -> change code, compile, install and boot the current kernel version.

Signed-off-by: Manuel Ebner <manuelebnerli@mailbox.org>
---
I think the lines
+This document is designed to provide a list of the minimum versions of
+software necessary to change code, compile, install and boot the current
+kernel version.
could be extended beyond boot but I'm lacking thw words.
Thoose tools would justify this: gdb, iptables, pcmciautils, ...

PATCH 5/5 is related to this patch.
---
 Documentation/process/software-requirements.rst | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/Documentation/process/software-requirements.rst b/Documentation/process/software-requirements.rst
index 1ca8c5f73ad0..69d31a3b5be3 100644
--- a/Documentation/process/software-requirements.rst
+++ b/Documentation/process/software-requirements.rst
@@ -1,13 +1,14 @@
-.. _changes:
+.. _software-requirements:
 
-Minimal requirements to compile the Kernel
-++++++++++++++++++++++++++++++++++++++++++
+Minimal requirements to interact with the Kernel
+++++++++++++++++++++++++++++++++++++++++++++++++
 
 Intro
 =====
 
-This document is designed to provide a list of the minimum levels of
-software necessary to run the current kernel version.
+This document is designed to provide a list of the minimum versions of
+software necessary to change code, compile, install and boot the current
+kernel version.
 
 This document is originally based on my "Changes" file for 2.0.x kernels
 and therefore owes credit to the same people as that file (Jared Mauch,
-- 
2.54.0

