Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.79.88.28
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795624836;
	b=vWww82l4JXC6bAKcIlE+MU/jN/hOZL45RoLDg3xy+OcddpsBr/tBh2YvpUVmU6XjfrLA
	 FEFprureVlcq/vP91UFgkapQI5HmXkPqwtYAvkKquiaL6B/i6WrkPHM2H2yQx2FL4DPCw
	 MiGqtVnqGkfzphnb9yvGfSZCdIWNGVLMyyvkjrDo9XSA6qGgSwO3NhUIeEOhu1mcnvK70
	 1k5fI+Q/WbFSEa2hwH78bThDsYfA/nFDg288xZPmDGUPJcHCs7DxOpUR3L5DgsQqKDMI9
	 tN5thQJHr6FjyOTSuz6RdM1Z6oLa//gL2YNXx+fYH5hGM9q3HvnM2fI3lLugEvHo8dg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795624836;
	h=DMARC-Filter:DKIM-Filter:DKIM-Signature:Received:From:To:Cc:Subject:
	 In-Reply-To:References:Date:Message-ID:MIME-Version:Content-Type;
	bh=D1WrX7Eu3NXX4Y4cGSFnoTcZxUsvNMZvJbz2qQfl2+I=;
	b=ozbjKes8UiAx310qfdZJT/M1T0aGU39nTNQAttxU1FFp3LYWPtQ2CPe7j4cJ9abWu89l
	 9c8/M0LkGxLN+Il3T6cvXNqGSM5z9UDmdj59oXXz38H3HUZLgjmovTYz5c/LrpLXqIvVW
	 Dosfio1JjVeamw9GrDUX0G2xg6PddAlXcHE5FcFioj+MSMoea09j5I58Aj5gkeVnA5W55
	 5VkeWJA4bzn2MB6E8f512ZIg8gihuHw8TkSUca5DWvFnvvfxUnSh1oz9m7rd5F0yic4Gi
	 dXeqnwKA0ZLa7WN8gY8liW2LzdAcTJiixZEkTnHVAxyDDtCFh+NhYtLU9WsctU8uxFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lwn.net;
	spf=pass smtp.mailfrom=lwn.net;
	dkim=pass header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=c72mO2UM;
	arc=none smtp.remote-ip=45.79.88.28
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BB83606A321;
	Wed, 25 Nov 2026 16:40:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1BB83606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=c72mO2UM
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 1F2CA410D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1795624835; bh=D1WrX7Eu3NXX4Y4cGSFnoTcZxUsvNMZvJbz2qQfl2+I=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=c72mO2UMoLp72nZjQKe+DL81J3DFzG9wRtF9FM1o6+eUbmZKHN6uWwLwu5g4rFlxU
	 NLfjBMyrFMgUduM9/X+Z0kZ+E8PonEZcY5Idt/F8B688+UDdohOdZrM3BtKbA0fjlA
	 fDWh14uUPEjeqts374imZRo/1aCjBRcSNgI90utTOK7HjLBwyLlPjAwnWSLLryuqmB
	 TOHa5mnLc0w6UA9ysou9n1RjfanlS11YWewmIdzG2cuDrvYOudl4NWnF5Oe2X8pxmL
	 FfIOdAtQoTqQQG8/pelVOSQD51jFqbCjIV6Wm/RuAAMYZNVq24B6DMp+iLR3TiIbL7
	 a3gPzERPqkSXA==
Received: from localhost (unknown [205.220.129.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 1F2CA410D3;
	Wed, 25 Nov 2026 16:40:34 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Mauro Codella <mauro.codella@pm.me>, dwaipayanray1@gmail.com,
 lukas.bulwahn@gmail.com
Cc: joe@perches.com, skhan@linuxfoundation.org, rdunlap@infradead.org,
 workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: checkpatch: Fix DEVICE_ATTR_WO macro name
In-Reply-To: <20261107230208.326769-1-mauro.codella@pm.me>
References: <20261107230208.326769-1-mauro.codella@pm.me>
Date: Wed, 25 Nov 2026 09:40:27 -0700
Message-ID: <87a4mwx3t0.fsf@trenco.lwn.net>
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Post: <mailto:workflows@vger.kernel.org>
List-Help: <mailto:workflows+help@vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
List-Owner: <mailto:workflows+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

Mauro Codella <mauro.codella@pm.me> writes:

> The DEVICE_ATTR_WO section refers to DEVICE_AATR_WO, which does not
> exist. Correct the spelling to match the macro in include/linux/device.h.
>
> Signed-off-by: Mauro Codella <mauro.codella@pm.me>
> ---
> AI assistance: Codex identified the typo and drafted the fix and commit
> message. I reviewed the change and ran checkpatch.
>
>  Documentation/dev-tools/checkpatch.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

jon
