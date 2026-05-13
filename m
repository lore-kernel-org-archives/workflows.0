Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E519836F8EB;
	Wed, 13 May 2026 21:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778706264; cv=none; b=uKmk2Pr6QaHjKcG7LWHcIWDvLtvINFNJ19CYHBibLrat93z8apwiS6nYqvh3rFNGXipBcQFZBLOhLjraszprVpkNEVuUmeHEagP+BRP44RZQphOnMZZkbLVqfLdkOCicoKgcjHPcEGL31HYjRX1BAe5W2BG4wVoPlNTiL1w5T2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778706264; c=relaxed/simple;
	bh=q261tR2Z08raoFwFEelYY7tx3Hs6qNpMFyhbD3aKRqk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=TZ/xWCWg5jSoQP/i5pgsmDkFwGhnvgdeuluGWH6bgvlQbWqWjy3E5IagV68qqdYSiH37EzBOIJc0H5tcjYbZIIMgLH1vIAhIdQT4RsjHtLR1zzRYNC5VkJ+wv0IpRe34Ko2HfLq3x7JqAiEWDU2BZi1FCmtO2Iuc9u+F49Ba1uM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=e933nwib; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="e933nwib"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 6763E410B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1778706262; bh=ssWX1HULZSzPjKdYTB/B6ssTlP53903uWcdlsv9iXAo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=e933nwib0b+floQlw0ajL2Xkg0B7PNW4ZIfROVxxiSgFabgIEsBqPYA8SpPsjhA7D
	 nx41rw7sN0r7cvvUX0Xeusht5cNGfmsDnSKGsP9Ea+LFv+WmAH/FGTK4WAh0qGPGFG
	 Bi+kle3KsVIu68xP3cESHAuLwGyRuHx50vbl8WUYqZbPyBlURzAp0ii/Q340ajg3s3
	 7s85Vtk5dg5fPihjWaKIMhs7tM74qKmwW09lb0Su5dqvxEHYDuqvOA/gc/k1Gt5jQl
	 C675A2vkuajuqi0r1jPqvpUcLUCBKIDAsBMldoM74BRHUzZDIqK6b31kwluvuf+Sfp
	 6ly335GWD7kvg==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 6763E410B5;
	Wed, 13 May 2026 21:04:22 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Willy Tarreau <w@1wt.eu>
Cc: Greg KH <greg@kroah.com>, Leon Romanovsky <leon@kernel.org>,
 skhan@linuxfoundation.org, security@kernel.org, workflows@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] Documentation: security-bugs: explain what is
 and is not a security bug
In-Reply-To: <agR1-2Sj1KO9oM2k@1wt.eu>
References: <20260509094755.2838-1-w@1wt.eu>
 <20260509094755.2838-3-w@1wt.eu> <87wlx8o87g.fsf@trenco.lwn.net>
 <2026051333-puzzle-smokiness-8096@gregkh> <agRfFoMC2Gcu0Esz@1wt.eu>
 <87ecjfmpzj.fsf@trenco.lwn.net> <agR1-2Sj1KO9oM2k@1wt.eu>
Date: Wed, 13 May 2026 15:04:21 -0600
Message-ID: <87fr3v6my2.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Willy Tarreau <w@1wt.eu> writes:

> On Wed, May 13, 2026 at 06:52:00AM -0600, Jonathan Corbet wrote:

>> I definitely wouldn't argue for making it longer, and enumerating all of
>> the make-me-root capabilities would be silly.  I would consider just
>> replacing CAP_SYS_ADMIN with "elevated capabilities" or some such.  That
>> might rule out legitimate reports where some capability provides an
>> access it shouldn't, but I suspect you could live with that :)
>
> I think it could indeed work like this, without denaturating the rest
> of the paragraph and having broader coverage. Do you think you could
> amend/update it ? I'm not trying to add you any burden, it's just that
> it will take me more time before I provide an update :-/

How's the following?

(While I was there, I noticed that threat-model.rst has no SPDX line;
what's your preference there?)

Thanks,

jon

From 1e15a25142583e312dcc504b0279d47508cbfdab Mon Sep 17 00:00:00 2001
From: Jonathan Corbet <corbet@lwn.net>
Date: Wed, 13 May 2026 14:58:53 -0600
Subject: [PATCH 2/2] docs: threat-model: don't limit root capabilities to
 CAP_SYS_ADMIN

The threat-model document says that only users with CAP_SYS_ADMIN can carry
out a number of admin-level tasks, but there are numerous capabilities that
can confer that sort of power.  Generalize the text slightly to make it
clear that CAP_SYS_ADMIN is not the only all-powerful capability.

Signed-off-by: Jonathan Corbet <corbet@lwn.net>
---
 Documentation/process/threat-model.rst | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/process/threat-model.rst b/Documentation/process/threat-model.rst
index 91da52f7114fd..f177b8d3c1caf 100644
--- a/Documentation/process/threat-model.rst
+++ b/Documentation/process/threat-model.rst
@@ -62,7 +62,8 @@ on common processors featuring privilege levels and memory management units:
 
 * **Capability-based protection**:
 
-  * users not having the ``CAP_SYS_ADMIN`` capability may not alter the
+  * users not having elevated capabilities (including but not limited to
+    CAP_SYS_ADMIN) may not alter the
     kernel's configuration, memory nor state, change other users' view of the
     file system layout, grant any user capabilities they do not have, nor
     affect the system's availability (shutdown, reboot, panic, hang, or making
-- 
2.53.0

