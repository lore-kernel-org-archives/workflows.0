Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 537AD770F5
	for <workflows@vger.kernel.org>; Wed, 19 Jun 2024 09:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718788126; cv=none; b=RuTVk0P9re9FrwBqYVuC+mgLv3p7aQ/G3mY7FuImqYFU2rF9ag7h9n8hN1/QiiYuDnK67sZmfvBZLCo+Lf9tWCEe39KdPXl7i8ElU9lbLfkmDDqMzpFqmKOjK3QXYcxCnRIz2+39lqDtq6l0wIAue5mZwHew3tjCcWVe0yoGtMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718788126; c=relaxed/simple;
	bh=l5ExirGQyRAtIOk0NhDOS9E3Rwzt/v5G6frBd1Eto7s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DV68Xbjg6EvAmaYNU9iRJIADt9Vv3g0S2DoXXpjZGVHRZj7iYA6qAqA00lmHagaNXTmShC5E12hsC3erht9VJ38FAskZ/UgFrfWznf7xp5ssbcj1SwvPAR+F8BPnyraMO5NfFjbi86UxpDzJi06B4V6H9oQ5nbJBqznX0jAJOsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Gzd29QvA; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Gzd29QvA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718788124;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=H6etdIHf+vLceRRGRQM9DwQ8BkpeTzkHdW5ywbuRdZ8=;
	b=Gzd29QvAO36RcsWj8oRSIaCLtCSkkQLDatT+MAMCeJv4P8eVs5DzB/QJTpIq3s2i+/TP0x
	NhuqcDt9Eb9s1tqfsT5L/ZVJM2vWIaGKZC/MQr54ebfF4aXs6sjhmd2QhlXKnr90+dx5AD
	N0u7Px0jBiDgF7a0tZLTqaGr6F37Y58=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-478-eX21UzltMXSz3Gz4aneflA-1; Wed, 19 Jun 2024 05:08:40 -0400
X-MC-Unique: eX21UzltMXSz3Gz4aneflA-1
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-421f3b7b27eso56409205e9.1
        for <workflows@vger.kernel.org>; Wed, 19 Jun 2024 02:08:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718788119; x=1719392919;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H6etdIHf+vLceRRGRQM9DwQ8BkpeTzkHdW5ywbuRdZ8=;
        b=WKwTNDbzUfhcp7SF7++CnhTu3Whwa0GYtzKiDyT0T6mSS5UPmgVxVcOkFGd2EPXVVj
         N03Bc2eQiQb5e1hSFX1acKtrVIq0EXrSu0cAPCvRJAmjed7t4MRkSS0ZFBoGdqFbRR1M
         DFTrMbrLQ06JRQ3776d6MNzFCaCJQSbbuxdj7xKlNylSWkQ/YLCsLQ0PfbsCkQY88PLL
         5r7SgcVDk7W8y82y0GozPe2uHi5yUKZSqLlKXMfMpfho0AfUIxH+3LgCciEkqKuQFzS8
         DGFhPrOCMPHYyZXJ2UiVu72onfoXvOyTF7WXng19HsqpWkaKIMXngzhQhtTByUl8Gy7e
         Ip3g==
X-Forwarded-Encrypted: i=1; AJvYcCVBsTH6pNRt62GFQHGES8na+6g0CI9Ccpg2d7X8ATWQdDt37D3oJejDnkYI9CqF/49ytRoo7ZzagKW+Fckuy1whKrE1Shr4ymsq
X-Gm-Message-State: AOJu0YwF84hTm1sWYr8VO/s/CCwqqQnMDbrIt8ibzMEr+KRMGaExf5U8
	MmgUngu0v9xf4zLHk92CjgZJXN062gfFb1VKDnR+EwdA7Z/W5bc5oFz+UqVZT+sViR9sgk3JA5v
	DP8YkF3B6gtYA87KIGl/v8YJ81Hkhlwkcj0Z+w7DZSdtJgHOHkr3UOw9Xag==
X-Received: by 2002:a05:600c:214c:b0:422:683b:df31 with SMTP id 5b1f17b1804b1-424750796a4mr16406145e9.7.1718788118661;
        Wed, 19 Jun 2024 02:08:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEDmHDeUKSzvwFZloG+Wasg47pkCbBVp7dtO2iM2/FT/vYQ18GUuBHQi2kxayKUmsy2s8xgdg==
X-Received: by 2002:a05:600c:214c:b0:422:683b:df31 with SMTP id 5b1f17b1804b1-424750796a4mr16405765e9.7.1718788117895;
        Wed, 19 Jun 2024 02:08:37 -0700 (PDT)
Received: from redhat.com ([2.52.146.100])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-422870e9681sm260339195e9.28.2024.06.19.02.08.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 02:08:37 -0700 (PDT)
Date: Wed, 19 Jun 2024 05:08:32 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Carlos Bilbao <carlos.bilbao.osdev@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	ksummit@lists.linux.dev
Subject: Re: [PATCH 2/2] Documentation: best practices for using Link trailers
Message-ID: <20240619050715-mutt-send-email-mst@kernel.org>
References: <20240618-docs-patch-msgid-link-v1-0-30555f3f5ad4@linuxfoundation.org>
 <20240618-docs-patch-msgid-link-v1-2-30555f3f5ad4@linuxfoundation.org>
 <87r0ctfh93.fsf@intel.com>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87r0ctfh93.fsf@intel.com>

On Wed, Jun 19, 2024 at 11:50:48AM +0300, Jani Nikula wrote:
> On Tue, 18 Jun 2024, Konstantin Ryabitsev <konstantin@linuxfoundation.org> wrote:
> > Based on multiple conversations, most recently on the ksummit mailing
> > list [1], add some best practices for using the Link trailer, such as:
> >
> > - how to use markdown-like bracketed numbers in the commit message to
> > indicate the corresponding link
> > - when to use lore.kernel.org vs patch.msgid.link domains
> >
> > Cc: ksummit@lists.linux.dev
> > Link: https://lore.kernel.org/20240617-arboreal-industrious-hedgehog-5b84ae@meerkat # [1]
> > Signed-off-by: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
> > ---
> >  Documentation/process/maintainer-tip.rst | 24 ++++++++++++++++++------
> >  1 file changed, 18 insertions(+), 6 deletions(-)
> >
> > diff --git a/Documentation/process/maintainer-tip.rst b/Documentation/process/maintainer-tip.rst
> > index 64739968afa6..57ffa553c21e 100644
> > --- a/Documentation/process/maintainer-tip.rst
> > +++ b/Documentation/process/maintainer-tip.rst
> > @@ -375,14 +375,26 @@ following tag ordering scheme:
> >     For referring to an email on LKML or other kernel mailing lists,
> >     please use the lore.kernel.org redirector URL::
> >  
> > -     https://lore.kernel.org/r/email-message@id
> > +     Link: https://lore.kernel.org/email-message@id
> >  
> > -   The kernel.org redirector is considered a stable URL, unlike other email
> > -   archives.
> > +   This URL should be used when referring to relevant mailing list
> > +   resources, related patch sets, or other notable discussion threads.
> > +   A convenient way to associate Link trailers with the accompanying
> > +   message is to use markdown-like bracketed notation, for example::
> >  
> > -   Maintainers will add a Link tag referencing the email of the patch
> > -   submission when they apply a patch to the tip tree. This tag is useful
> > -   for later reference and is also used for commit notifications.
> > +     A similar approach was attempted before as part of a different
> > +     effort [1], but the initial implementation caused too many
> > +     regressions [2], so it was backed out and reimplemented.
> > +
> > +     Link: https://lore.kernel.org/some-msgid@here # [1]
> > +     Link: https://bugzilla.example.org/bug/12345  # [2]
> > +
> > +   When using the ``Link:`` trailer to indicate the provenance of the
> > +   patch, you should use the dedicated ``patch.msgid.link`` domain. This
> > +   makes it possible for automated tooling to establish which link leads
> > +   to the original patch submission. For example::
> 
> Mostly highlighting my own ignorance here, but s/provenance/origin/
> would've felt more obvious to me, as a non-native speaker.
> 
> BR,
> Jani.

Or even "origin (message id)" to be very explicit.






> 
> > +
> > +     Link: https://patch.msgid.link/patch-source-msgid@here
> >  
> >  Please do not use combined tags, e.g. ``Reported-and-tested-by``, as
> >  they just complicate automated extraction of tags.
> 
> -- 
> Jani Nikula, Intel

