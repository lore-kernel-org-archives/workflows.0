Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8C39218E83
	for <workflows@vger.kernel.org>; Fri, 24 Jan 2025 08:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737707902; cv=none; b=Vz4j/brXTQwAUvWMtfTRtQPdP/59l8L3HcFbSmUQ5YT2bxj3SwklxVoZypzJFYFcdJavG2D+Wq/j+V7e7VhfOXgRrTWLMqMnSQakv9KgiUcPwunvTubjOKxZp5sGXhR8Wh1Enkv5/vpWETSVabVbBHGMO1vlZakJaO2LHeuMTQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737707902; c=relaxed/simple;
	bh=9tddCrPwZq+AKGA6FysyP+fBCq0+ub/7HsVtiuOI4UI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K9mh05dG9qZEK4dRv8w7gc/7NBFH5iyRk4880tNXAaLxFUWDH5W+bFZ6Z8y6BblOtLaGJ1JM37RipKy+IfPWBWXfiO540oS4H/REqAV0MikJIFgoi0PNVjU42QbLcgkB8ef8GLerGAoFEIUGWcyM1Lqu8wwbn05qb2ui7QTJDyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=S2KOUF1s; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="S2KOUF1s"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2efd81c7ca4so2602024a91.2
        for <workflows@vger.kernel.org>; Fri, 24 Jan 2025 00:38:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737707900; x=1738312700; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9tddCrPwZq+AKGA6FysyP+fBCq0+ub/7HsVtiuOI4UI=;
        b=S2KOUF1se5UwAw83s+bJv7LjVtoTq65NZLdT8uoCOPCJOHxJoDbDBiDTrJ8FbF1BtZ
         /RwYUMnYJlwLLKeclTciL3lyQhLfUHPro1YZ6N9CqiV1t2MdOcQCmlKxqkxI9m772Scs
         ZMyiULSAZHo47IuxIKz4RaXaN5meD3l4gjVKru8xvD2a8vsRWYK2vNVx+8zVeSySQ4e3
         tv4W3PAKnsWpXz9ueGV0tPxJrcNMVvsOeB2gG0zgeRPz0XSPnzBEIa6ITvTqlIVPx+4p
         gBEaMtkzRoUjhajicxFtZU+FlyMHNDYL/W6JK5hRT8D0GbjaN3ZUNMqg4+1NX3t9a+Kl
         RwGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737707900; x=1738312700;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9tddCrPwZq+AKGA6FysyP+fBCq0+ub/7HsVtiuOI4UI=;
        b=oc/PFyeFz17lEeeP8phDy8dfwCr7EZZ4YZ/gD01WNG6te2qfSacsaNJWc6CoRAzvTj
         pgCXk6b1tYkaaCBToBx9bNpviO8ch5629Ci1MlbzBSDmCIuvqfIwdcmnsrjo+fBqr6o2
         sud7RDZBZ3vCNOZtxRvL5i1gkjeM1aZKJb963a7ay3ZAMgVeLMFTPwiSRz7enpP5HjCK
         KBVKRWd7eLC/QWjw5ylhGnSv30NAmjmQka1HG6CisVk90YnKo3SCtlpg6Eb9ayHZh3F+
         p5edE9O7BDcM1yKByMIkkvfXRJ7qI1DLC1YrWJ5wiPj0rFcS+deh6OH//JmJRxB+qWXC
         cK6Q==
X-Forwarded-Encrypted: i=1; AJvYcCX29y8z/uAFmafFnxrfePqqiV8c8WGSiFJQq33PuCxPC/eTM1ue2byMpb6keEg8bgQFaByPU07Id2o=@vger.kernel.org
X-Gm-Message-State: AOJu0YztLvYnmebjuBOgGElhUly0fUBXtE0I63mTK7+X7l4hDH61UGc+
	1SPAn8XiNI95ahARtz8WoLUIeGePsxMR2G+iOJbYNS8zo5gLfs7MAERlGkT8ag10QNRmh+dLvXA
	CU+Kg6A3zsqFaEWSinH0ODVE1zPycPQsLHDV5
X-Gm-Gg: ASbGnctrvbETtwJfV5pVe+VB5W8y1wf9mV278zp7RI4LT1vkb5FnIGwix2wUgzkIwX8
	oyQTcvWLqo6qxrNqDRauakKy8cl7YyJXk20z6nuCz0QS4enMshimjuWmQB4/dMQ7dQKJyaAOvH5
	hJAsXf1kSyAAzSPq4tEQ==
X-Google-Smtp-Source: AGHT+IEZKMIErd/m+nXJGLBmsQwUn4sNJSBqhiaeDoFjEqgULKrwlHdpmZ0Q1HenaeqrwDllOoybmydJ1CP0sqieb10=
X-Received: by 2002:a17:90b:3503:b0:2ee:9d65:65a7 with SMTP id
 98e67ed59e1d1-2f782d7ff77mr40198898a91.29.1737707899764; Fri, 24 Jan 2025
 00:38:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250123-kfence_doc_update-v1-1-9aa8e94b3d0b@gentwo.org> <b788d591-4c5f-4c1d-be07-651db699fb7a@suse.cz>
In-Reply-To: <b788d591-4c5f-4c1d-be07-651db699fb7a@suse.cz>
From: Marco Elver <elver@google.com>
Date: Fri, 24 Jan 2025 09:37:43 +0100
X-Gm-Features: AWEUYZnsNQFUSJsERPtNV2HXTL_4mZGDJWzPTu4wScV_GdE309XO7yGCB5BQmXM
Message-ID: <CANpmjNM_2EB-sTBjPDADNh_cAEJS8euY_71pw0WNu2h_eisAYA@mail.gmail.com>
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

On Fri, 24 Jan 2025 at 09:13, Vlastimil Babka <vbabka@suse.cz> wrote:
>
> On 1/23/25 23:44, Christoph Lameter via B4 Relay wrote:
> > From: Christoph Lameter <cl@linux.com>
> >
> > KFENCE manages its own pools and redirects regular memory allocations
> > to those pools in a sporadic way. The usual memory allocator features
> > like NUMA, memory policies and pfmemalloc are not supported.
>
> Can it also violate __GFP_THISNODE constraint? That could be a problem, I
> recall a problem in the past where it could have been not honoured by the
> page allocator, leading to corruption of slab lists.

KFENCE does not sample page allocator allocations. Is kmalloc()
allowed to take __GFP_THISNODE?
