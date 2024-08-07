Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD7EB14375A;
	Wed,  7 Aug 2024 19:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723057268; cv=none; b=Xys7MvFFdXyqZ2BnB1ovpqwcvBEZkjiZ3dGy/jjyHpUEbi5XdkOslZhQamO73c5SdlIBZKuOhKpllffEb0AGcsjQyJg8sDWqU2Nmv4Bqs+mUy6cejKl4PJkat/cf3SAE4pz+vKXviVcnjwFTZpumGq5ApBwaDdf8kTmnBaXwvW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723057268; c=relaxed/simple;
	bh=12ynQShKcfG200G5r9azurlpT7acM9Y6YU2EREFLdMU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=NeAU+HdYKaDZbrpZKEeDBXy+x9hk9lfw8qWCVzF4JIiBwNvl2ll1to5haOPOXewa7uYaY5PrOTq2KOBBqotNjI8Xfq+8lPLKUa3N68LPB8+JljhQ0Bjv7EDm/8fLke4EhBfJK/o7PigzbHCL6f8QvJsAA9Dg3uFXds9nqD7i6c8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=HDcqTOJo; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="HDcqTOJo"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net C4DCB418B1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1723057264; bh=JNDEhlunaLuIa545DF4ijzgQxpTe7pngoJLfTHw7hNg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=HDcqTOJophyR2sRbg3qCRJHS21PO4ucXa4LujX963WN1J9BhCN+hGRQJMFbxg2EPE
	 Eh8K3n/U5houLFKmy3SiTFFnVp8PAdskOgseJV0CNaCWipTev207x/QZsVfzrW9zsa
	 18CekpzSa8vtDyRvDxFdcRdYUiob2cR427AdVXwCyeilvWd9UlUi/GuSXUJ0xvfvQg
	 lGlf6hY5fJBTEpnGL9OBY38JDbhfRRWQbUzzGLF7pqACvzhXVsUtWOS27jTCI/Tk1R
	 AHoued/6wC1WDx+I+hIcEdf526w9SWJzTR67MMS97KX8tTr/yAhQbo8/ysIiqr9pOf
	 h6BFpyG0tQiow==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id C4DCB418B1;
	Wed,  7 Aug 2024 19:01:03 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Jiamu Sun <barroit@linux.com>
Cc: workflows@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH] docs: improve comment consistency in .muttrc example
 configuration
In-Reply-To: <SY0P300MB0801D1A4B278157CA7C92DE2CEBC2@SY0P300MB0801.AUSP300.PROD.OUTLOOK.COM>
References: <SY0P300MB0801D1A4B278157CA7C92DE2CEBC2@SY0P300MB0801.AUSP300.PROD.OUTLOOK.COM>
Date: Wed, 07 Aug 2024 13:01:03 -0600
Message-ID: <87h6bwrwcw.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Jiamu Sun <barroit@linux.com> writes:

> Added a space to align comment formatting; this helps improve
> consistency and visual uniformity.
>
> Signed-off-by: Jiamu Sun <barroit@linux.com>
> ---
>  Documentation/process/email-clients.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/process/email-clients.rst b/Documentation/process/email-clients.rst
> index dd22c46d1d02..e6b9173a1845 100644
> --- a/Documentation/process/email-clients.rst
> +++ b/Documentation/process/email-clients.rst
> @@ -216,7 +216,7 @@ Mutt is highly customizable. Here is a minimum configuration to start
>  using Mutt to send patches through Gmail::
>  
>    # .muttrc
> -  # ================  IMAP ====================
> +  # ================  IMAP  ====================
>    set imap_user = 'yourusername@gmail.com'
>    set imap_pass = 'yourpassword'

Applied, thanks.

jon
