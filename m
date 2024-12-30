Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FCD7183CA9;
	Mon, 30 Dec 2024 18:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735583941; cv=none; b=p4rPmjVqYjQnJL9R6MBt8xp750CVUw1JB6k0/qNMy/81NV8dBRcH3MLGAEHXYDIn/F7yUojc7WMs7dzjJ4y7rP41PkgKHqB3/wniCj+0D8BFBWSoJtWeEInxhjR6psvlZdaG7Ka08eWFJ1ym64uzyhdcCSQaJdKLz6teAlXs5Wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735583941; c=relaxed/simple;
	bh=mJ3hO+/hNEcjLZMHpuTU7RRZO+8DxR085NK+5Q1/eyA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=KXoszFkI2/LwPaKY510tvTal+ZVdS9klkGy21VCAVNCF+asb8vASKHVkliG85ejG55q9yHLK1/wPoHBhMJhnLKF04TuVnWYY1+zFrUyAqcDjwMx8P2W6iba8Rh+tHJGjaKLrTgHvTIsIyaRFVIoGZhL7e0ea54I3Qlamc2Z2284=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=AuEa57ES; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="AuEa57ES"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 5C58B403FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1735583939; bh=aLvJZd+tGLr7n9SyTfg/Xg28I2zAT6gjuMV8tzitAyo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=AuEa57ESpXKP2xWu4TKdtVPYiEEnoc5CVfFOoL0lBiUfLI9iDHCrOI/ZioiDdJ12L
	 kJ0UFf/sCuXR79CL0dDl4LtYCRohPRVEnVmkDDf02aI9b5APFL0goHlWNqA0RSmc3a
	 apPngVg1j2/xGDB/seADELF0q0iELidrmCHuhARDBLkNBuTzuRRfeOQp82O+VoEUc5
	 dLx742UGd8pPEBKTpnI0hdXJOkIUuMtKhNAzW8ISEV2r1TmNktr2XuSK9yV0R0nzgh
	 CeBC2JVAIuGg5b5zHmAy5YXq+S3pO/unPTOEqLYt6SlAMCCCj4ahrC15Znqc9+RWnn
	 1zaO4JdWyprgQ==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 5C58B403FA;
	Mon, 30 Dec 2024 18:38:59 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Borislav Petkov <bp@suse.de>, Rob Herring
 <robh@kernel.org>, Frank Li <Frank.li@nxp.com>, kernel@pengutronix.de,
 Ahmad Fatoum <a.fatoum@pengutronix.de>
Subject: Re: [PATCH RFC 1/2] docs: process: submitting-patches: split
 canonical patch format section
In-Reply-To: <20241220-submitting-patches-imperative-v1-1-ee874c1859b3@pengutronix.de>
References: <20241220-submitting-patches-imperative-v1-0-ee874c1859b3@pengutronix.de>
 <20241220-submitting-patches-imperative-v1-1-ee874c1859b3@pengutronix.de>
Date: Mon, 30 Dec 2024 11:38:58 -0700
Message-ID: <87v7v110e5.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Ahmad Fatoum <a.fatoum@pengutronix.de> writes:

> To make it easier to reference specific parts of the patch format,
> let's add some headings for different parts.
>
> Doing that, it becomes clear that backtraces in commit message is out of
> place being after Reply-To Headers, so move it next to the commit
> message body subsubsection.
>
> Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
> ---
>  Documentation/process/submitting-patches.rst | 56 +++++++++++++++++-----------
>  1 file changed, 34 insertions(+), 22 deletions(-)

This seems like an improvement - I've applied it, thanks.

jon
