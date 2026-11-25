Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.79.88.28
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795620262;
	b=Mx+yytExkPiD+HBmAzvym45lYUvUX6nrmeidRa3arpL/7UjSGvNTTjelZeLSmHYmnHQT
	 uI9ji6hNBCscG0k43gc4fsis2BNGJMC07DO2QbyOggwfyHHDMm3Cc+e/NnYMUqpo81XIY
	 ECwQODrd+rz502iO+oaZdNNmDK78l19d8pIThsOSPyUBmQArXxIpSVKTg6kYILeGA/pyh
	 s4vFXZbFGN0fIQ3jetXyGocygEatw15NqOEIy9EHsS8dJGgvNlwNO+LRMaHjl3dDzqm3i
	 B77Y6ICoMMbw6WvysmVPmDTDYuRmbeVRrLWRd/bM6+DD0JTNgPm/T8KogTeWLjp4o5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795620262;
	h=DMARC-Filter:DKIM-Filter:DKIM-Signature:Received:From:To:Cc:Subject:
	 In-Reply-To:References:Date:Message-ID:MIME-Version:Content-Type;
	bh=BszTx2TV1cfaVUeSJv4bTbWbaiboouVqaL4PeMuZsN0=;
	b=y7HFoKLovAH1nGKDnUzcFquKRIZo3of+1Cn/8EFa9Uaj/66D1a6yxd5eS304pgGerAuO
	 p6oKuljXaVMR/8JojkJLymncO5gl+beb/pD3kL+Kl3rtrGm3MvY0BZykJQI6DeMDfPHYB
	 tMS4Pv5n8nC/U9r5bTqGYKds5h76v9jUkjmSugyUiFsRGdJDf2LrLU9GvPZ3ESWcuACah
	 wPRY383vZIDPpLo3Rwyp+oxmtTfhCP3fMLAnqXf7QXXK8H3C9wB9H/UICHD4tTLdd0Cfk
	 4UHvKHz2fAGd+gj5+2JVkKmDDgY3NlThAyt2cMddqPgVwSdFJe+gqGjm5VLEAmFFmcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lwn.net;
	spf=pass smtp.mailfrom=lwn.net;
	dkim=pass header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b="lT1zvTk/";
	arc=none smtp.remote-ip=45.79.88.28
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56CE8606A323;
	Wed, 25 Nov 2026 15:24:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56CE8606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=lT1zvTk/
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 237A1410D8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1795620260; bh=BszTx2TV1cfaVUeSJv4bTbWbaiboouVqaL4PeMuZsN0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=lT1zvTk/XDrWEshJ/RMaTkqWUoQzDPT4VtyzSK2TOSWyaLH4betjAejk0TtaQIm9X
	 AV0X8pOVPwpziYQXgNp31azMbnaEnOrr+LsRFJlatnqvbCSVtfCYI/FQj6L+Xq1faw
	 OaURqXi6mtg/ktlLRRU+scP5zxdtoTJV+TKjmjIsJrEoapCK3N82lU0riX+m1a8aBC
	 /uyy3ajvX/9NxF5TushReJwoWRDWLLk4f1CAFPJz+iDfNqkE/B2IOcpqhR0VdKyW72
	 uNbYuMGteBbwThwZG1HNBbMkarMbp1mQ5/0pQ39MtTjfDGfFspI9YvhQ/t85O9ONyS
	 kGoptlh0xTC+g==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 237A1410D8;
	Wed, 25 Nov 2026 15:24:18 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Zenghui Yu <zenghui.yu@linux.dev>, linux-doc@vger.kernel.org,
 workflows@vger.kernel.org
Cc: skhan@linuxfoundation.org, rdunlap@infradead.org, Zenghui Yu
 <zenghui.yu@linux.dev>
Subject: Re: [PATCH] docs: submitting-patches: use :ref: links and remove
 unused anchor
In-Reply-To: <20261121163923.73026-1-zenghui.yu@linux.dev>
References: <20261121163923.73026-1-zenghui.yu@linux.dev>
Date: Wed, 25 Nov 2026 08:24:10 -0700
Message-ID: <877bi1ylwl.fsf@trenco.lwn.net>
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

Zenghui Yu <zenghui.yu@linux.dev> writes:

> Convert three plain-text references to the "Tagging people requires
> permission" section into proper :ref: links using the existing
> tagging_people anchor. Remove the explicit_in_reply_to anchor, which is not
> referenced anywhere.
>
> Signed-off-by: Zenghui Yu <zenghui.yu@linux.dev>
> ---
>  Documentation/process/submitting-patches.rst | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)

If I were being pedantic, I'd say that the tag removal should really
have been a separate patch.  But I've applied this, thanks.

jon
