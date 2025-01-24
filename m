Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7987B1D5CF5
	for <workflows@vger.kernel.org>; Fri, 24 Jan 2025 12:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737720263; cv=none; b=JOK2C9vPCyoMVzL1BXW/VvAF7l8YwOnUKzZEq2g+7iodpNFl2ZVXoPfpwR/mqKmYCctTb5E+UO7+wnFwIi82IR8pAFVck8ZMSifry7BdVE8SXEu6KN5tCXnRaVksrWJggkTTXgta7s3Qg/ttZZC4V5xJMx6GXclHUiHkOpZgUSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737720263; c=relaxed/simple;
	bh=CSX+I23Oo26cufSOeOQC+f6IhD956qz71ZwQ4NUSVJ4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GFZmaWjq2Ojf6MOG5QgzsiSV9lSBd35rd2NENnalSgN949FtTe355LNhy2S4qkIBsbyuUYpP9PGJF0xwHyG/dMRwY8f2PCcChA7DF3caz27zWBEpf0ylDxj31vAk3lH+rrJuHsKp6yvXLL6jXsKaXTdBytQMQFkUddqbvGsyaVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=K732jTry; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="K732jTry"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-21649a7bcdcso34414335ad.1
        for <workflows@vger.kernel.org>; Fri, 24 Jan 2025 04:04:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737720261; x=1738325061; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CSX+I23Oo26cufSOeOQC+f6IhD956qz71ZwQ4NUSVJ4=;
        b=K732jTry8UjNuOLSGyDxhpQ7Ajfahd0N6lvJdDn6WVZrNe3jD+sAGAHy5oQGfpm4rO
         /ibjFBW6Vbg8D6sz9xyDBwWyx16zcMdJZOt56K62TDommH779ZOUKN2+2eiVQWBvS2N/
         Z1m37Kf2xqWLZhHqcIqT0ZeFWSrKo63SFzKerKRW3aHN0UKXcYcoS6fXqSpmeL60ETJK
         TXFaiDH/6RxHesWAFbLJOq4mBW2jGsftOZVCh+dbfxk5v/MyLuChoxX8ghSvk/aLOR/Z
         Z4yPMG+QhGqsEl8A/JO933hUDriR3oW7VQDyKgRHXVoPmy3gAihKeTG5GtmJP2WJqk0t
         YLjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737720261; x=1738325061;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CSX+I23Oo26cufSOeOQC+f6IhD956qz71ZwQ4NUSVJ4=;
        b=n42BioyYveI2SscZofiplRaolFaJZUgMK6EiYmwqGXsVRmYfLga1BPybhXmGDyNLZP
         duyNBFueTrDmXmpry37WhOPbDYBN9Db76vj28XYwRryPpbLlI7S26kyf0fpMx41R5vSs
         djN9vexs2lRZ2cja4cVAAVikCsBXflXybxOfIwWLktcghFhVYeeJatwyDS0RLgCeAxpv
         sjALw//tGu760uGTYNkuf0l4rQKu02yaEj2Qkm26yIliXVTCnW1xVUct5OthXNAs+BIS
         f9Bk/GMrt5/az6g1RsRtJLv3eumcrc4UDa+ggpIMtWTBHLDQ6jfVWru5IV9PEiFc2BMw
         EgPA==
X-Forwarded-Encrypted: i=1; AJvYcCUEW+fr2xIuyY9QNE+IdJmsgG/6kEWjuytGUhGJBKFbiHIxl1hmfizvOom0xqc5yOyYUL5AUfaiUF4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzNd69djJeBdEFFYCUwLrmWI6hTJMziOeZrD/rbi8PA2NCX75Id
	VyRwB4gx2mXn0LpToG1KLIh28rk/z1tLd/xlZA6+eFhROWStBdYI6xLFCpMwHysnsoAkNXVRkUw
	zTp7U0JNbgZMawMgHqKYUzwwB4ZuLKTHQcDcU
X-Gm-Gg: ASbGnctbGXdUIiLepydvRgctY7m5uY5td8h6MskDN4gUn/dt5tEFBxGf4eO8zUTtole
	k/d/OyRsmf7vZWm7kaTtaCSUky8L/m8TJFu1U9np8HowpkviQ08BNuL92SoXZpJZc9TUCAem/Z2
	DaD6Wy9RI5aP7ypmz+tQ==
X-Google-Smtp-Source: AGHT+IHFWPJSl8RQmHDYRKbASweTG6JiwATd1M2hGsjkCQxSRSHoxR6F/3sAbhNvt4TA4UMf4NebCqUlYWF3ycveCB4=
X-Received: by 2002:a17:902:e80f:b0:215:8dd3:536a with SMTP id
 d9443c01a7336-21c352ddfc1mr467804675ad.4.1737720261424; Fri, 24 Jan 2025
 04:04:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250123-kfence_doc_update-v1-1-9aa8e94b3d0b@gentwo.org>
 <b788d591-4c5f-4c1d-be07-651db699fb7a@suse.cz> <CANpmjNM_2EB-sTBjPDADNh_cAEJS8euY_71pw0WNu2h_eisAYA@mail.gmail.com>
 <c63dd8c4-a66a-4a97-ac94-70b3159ba3a8@suse.cz>
In-Reply-To: <c63dd8c4-a66a-4a97-ac94-70b3159ba3a8@suse.cz>
From: Marco Elver <elver@google.com>
Date: Fri, 24 Jan 2025 13:03:44 +0100
X-Gm-Features: AWEUYZm28xnd5LD3ceGeFbFo-hDUX9NWI27ecbNAaKsVlaUXmPGeTLJFJu_kABI
Message-ID: <CANpmjNNpFTweLW_QawTa6eqF6vOrKZPL17r16CaVipPWqZsSKQ@mail.gmail.com>
Subject: Re: [PATCH] KFENCE: Clarify that sample allocations are not following
 NUMA or memory policies
To: Vlastimil Babka <vbabka@suse.cz>
Cc: cl@gentwo.org, Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Andrew Morton <akpm@linux-foundation.org>, 
	Yang Shi <shy828301@gmail.com>, Huang Shijie <shijie@os.amperecomputing.com>, 
	kasan-dev@googlegroups.com, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Christoph Lameter <cl@linux.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 24 Jan 2025 at 09:42, Vlastimil Babka <vbabka@suse.cz> wrote:
>
> On 1/24/25 09:37, Marco Elver wrote:
> > On Fri, 24 Jan 2025 at 09:13, Vlastimil Babka <vbabka@suse.cz> wrote:
> >>
> >> On 1/23/25 23:44, Christoph Lameter via B4 Relay wrote:
> >> > From: Christoph Lameter <cl@linux.com>
> >> >
> >> > KFENCE manages its own pools and redirects regular memory allocations
> >> > to those pools in a sporadic way. The usual memory allocator features
> >> > like NUMA, memory policies and pfmemalloc are not supported.
> >>
> >> Can it also violate __GFP_THISNODE constraint? That could be a problem, I
> >> recall a problem in the past where it could have been not honoured by the
> >> page allocator, leading to corruption of slab lists.
> >
> > KFENCE does not sample page allocator allocations. Is kmalloc()
> > allowed to take __GFP_THISNODE?
>
> Yeah and SLUB is honouring it.

Fix: https://lore.kernel.org/all/20250124120145.410066-1-elver@google.com/

Thanks for pointing it out.
