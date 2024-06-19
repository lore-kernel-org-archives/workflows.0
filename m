Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF7E5770EF
	for <workflows@vger.kernel.org>; Wed, 19 Jun 2024 08:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718786515; cv=none; b=gvYKK4Nw5yc89SBOA54WDOxDlr1xbWaPZZwwmIsVcnZdslZ94TUTGc+3+hXGm39eW42AXMUbpsr6FwxvA8wRsAIxDuxcMNxZmqRA2G2txNVOZsdoGZa4w3nAAr/KeOYlRfu16J7tXJbmr+zQUBjZjReMwbzLh+IDRhtKOpcYDjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718786515; c=relaxed/simple;
	bh=rWeIOug2Ynbv6OTURHg7XDbCwxyQQJLoRG3mJeBPx7s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uYZgBprrRNY38jTUNkXpF9bc41F8gfr+54EUqTi2UrO5oFnQbwdlG6bZglR7uXgU213QYBMHebuZrmkIJqODZ05OwyKMw9wflyQuP6BAm7RlZhjW0BTjNV4vF3PJJybjLVSR+uqltyYLxbdH59bE41glcgUOmktp3lnhzrPJX5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=a+KXMmjZ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="a+KXMmjZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718786512;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XdxpcAnJIttE7xF3rf60XtSKDuT7zxfz6ipOIlDZ/C4=;
	b=a+KXMmjZdv/OUbl8hyd2L2EaOD6aCln6h8FWX67WHpn0apIoOOd7JfH7mYT+H6snh3xDCP
	J8ltlfgmKNhymIdnRoF5hMhQ5zvB2OCz+Xm0L3T2UuI2rOfzUukEYFieFF9zr539bvry5Z
	UPKY/qrFETHT4m2NUq60apCuCc+CmRo=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-443-xQ6cqFXcM5-AUguhLbemGg-1; Wed, 19 Jun 2024 04:41:51 -0400
X-MC-Unique: xQ6cqFXcM5-AUguhLbemGg-1
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-362763f8d2eso674777f8f.3
        for <workflows@vger.kernel.org>; Wed, 19 Jun 2024 01:41:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718786510; x=1719391310;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XdxpcAnJIttE7xF3rf60XtSKDuT7zxfz6ipOIlDZ/C4=;
        b=XcLxA2ndO3IgET3e6T1Y/ckc/l1VE4ATvjd6Ifj+H+bAv3SUCYLsPC9+PHRuXAaWi5
         lkMlTQKkI6bKhYlCvBXwkEygIHBDXp8WmyZ/GXS86pAn2my0QY/m1/J0Qz7OjICIEsXL
         cGUEr+zEZdmaU1/oDiJW5OX3iTTwxii43pqenzngRyQQD+X4IR6hudHGHkJU1CtIUqVk
         027iCCDeKlYF9xAouviFZKaK/ciaLGG/qVAv8l0/1NKp82AsMKcUHU+49fefSZcmamOP
         sazIp9Z5GgKZGFDVFAfxszvz6NqyYLGptqwkbBcd2XFHQ5eRGv7J5F/Ci0s7W19Aqtae
         +3Eg==
X-Forwarded-Encrypted: i=1; AJvYcCWDSTDdFKFd7EuT4e1JMLoWxTFSFNMBVht1mVdc+AI64t+jy6QdgS3WgdtJ0XleiIjcBSy4+bIu7tXDgvvTRJ/uGpJxjVhEIlMI
X-Gm-Message-State: AOJu0YzyCgLfrZlCSL2XF3NmEYkrJu2BzjBrOA+5PFVRZgTTQ3qxnedP
	K3dCLM7ks1aS/6+t1EHgsKvK3hcQXWMIgAve9utdimbiT13EWCf2LCI9KFLXm8qZWnoCDKJiaVh
	/YvrP+0hJ+y7fEN1vV6U4wbxx8HE7550mrGeCsf1zWHx3mR+4TMXbXKxZcA==
X-Received: by 2002:a5d:408d:0:b0:360:7829:bb93 with SMTP id ffacd0b85a97d-363177a3a72mr1642375f8f.21.1718786509773;
        Wed, 19 Jun 2024 01:41:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGmonG/1oENmgMotUOYhNKtoTPMrBWuRz2ayevhgGPlMbNtdCXnZPDcBQKyrmKw0SKJQvaQlg==
X-Received: by 2002:a5d:408d:0:b0:360:7829:bb93 with SMTP id ffacd0b85a97d-363177a3a72mr1642352f8f.21.1718786509061;
        Wed, 19 Jun 2024 01:41:49 -0700 (PDT)
Received: from redhat.com ([2.52.146.100])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-363bd4668aasm730542f8f.48.2024.06.19.01.41.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 01:41:48 -0700 (PDT)
Date: Wed, 19 Jun 2024 04:41:44 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Carlos Bilbao <carlos.bilbao.osdev@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	ksummit@lists.linux.dev
Subject: Re: [PATCH 2/2] Documentation: best practices for using Link trailers
Message-ID: <20240619043727-mutt-send-email-mst@kernel.org>
References: <20240618-docs-patch-msgid-link-v1-0-30555f3f5ad4@linuxfoundation.org>
 <20240618-docs-patch-msgid-link-v1-2-30555f3f5ad4@linuxfoundation.org>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240618-docs-patch-msgid-link-v1-2-30555f3f5ad4@linuxfoundation.org>

On Tue, Jun 18, 2024 at 12:42:11PM -0400, Konstantin Ryabitsev wrote:
> Based on multiple conversations, most recently on the ksummit mailing
> list [1], add some best practices for using the Link trailer, such as:
> 
> - how to use markdown-like bracketed numbers in the commit message to
> indicate the corresponding link
> - when to use lore.kernel.org vs patch.msgid.link domains
> 
> Cc: ksummit@lists.linux.dev
> Link: https://lore.kernel.org/20240617-arboreal-industrious-hedgehog-5b84ae@meerkat # [1]
> Signed-off-by: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
> ---
>  Documentation/process/maintainer-tip.rst | 24 ++++++++++++++++++------
>  1 file changed, 18 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/process/maintainer-tip.rst b/Documentation/process/maintainer-tip.rst
> index 64739968afa6..57ffa553c21e 100644
> --- a/Documentation/process/maintainer-tip.rst
> +++ b/Documentation/process/maintainer-tip.rst
> @@ -375,14 +375,26 @@ following tag ordering scheme:
>     For referring to an email on LKML or other kernel mailing lists,
>     please use the lore.kernel.org redirector URL::
>  
> -     https://lore.kernel.org/r/email-message@id
> +     Link: https://lore.kernel.org/email-message@id
>  
> -   The kernel.org redirector is considered a stable URL, unlike other email
> -   archives.
> +   This URL should be used when referring to relevant mailing list
> +   resources, related patch sets, or other notable discussion threads.
> +   A convenient way to associate Link trailers with the accompanying
> +   message is to use markdown-like bracketed notation, for example::
>  
> -   Maintainers will add a Link tag referencing the email of the patch
> -   submission when they apply a patch to the tip tree. This tag is useful
> -   for later reference and is also used for commit notifications.
> +     A similar approach was attempted before as part of a different
> +     effort [1], but the initial implementation caused too many
> +     regressions [2], so it was backed out and reimplemented.
> +
> +     Link: https://lore.kernel.org/some-msgid@here # [1]
> +     Link: https://bugzilla.example.org/bug/12345  # [2]
> +
> +   When using the ``Link:`` trailer to indicate the provenance of the
> +   patch, you should use the dedicated ``patch.msgid.link`` domain. This
> +   makes it possible for automated tooling to establish which link leads
> +   to the original patch submission. For example::
> +
> +     Link: https://patch.msgid.link/patch-source-msgid@here
>  
>  Please do not use combined tags, e.g. ``Reported-and-tested-by``, as
>  they just complicate automated extraction of tags.

I don't really understand what this is saying.
So when is msgid.link preferable to kernel.org?
And when is kernel.org preferable to msgid?



> -- 
> 2.45.2
> 

