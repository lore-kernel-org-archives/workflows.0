Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46D20258ECC
	for <workflows@vger.kernel.org>; Tue,  9 Sep 2025 17:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757440755; cv=none; b=hYvov49f09ll3HOnrVwEC8KhOrIW8E+6Id1tjnOw8RgQFk+5vY79OiJd7op35w3Oc9r554UsUOjGfvL3Gq2y8SV81wChS6fEYs6g+ES1cGq7eaG0lnU5UwK19yZoCY7xEDvzPHWTLtj0kmUfoDo0ImeQJwzbogOFQc4RQ0pzs5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757440755; c=relaxed/simple;
	bh=c9VmzZbrc+pRtYtQeM+DaVC2B+e5eMlSmeSeLCvR8cc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jbXqwmgWlnHz0m9DnPEq5WSrFEROquBTIIj2hJ7pEpx5PcS+eAKl+/mP9QfZD3KYbRiGh9w+XeoslHNjrBlMe8lMT33AmX9K5y0jZYBmuB+Po+bL2atmEFm8jGQ5+bZeK3hihKz5ZqeWx6tIwUCn6ovuDxvXylHQ7U/458Au2P8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Ypbez8D+; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Ypbez8D+"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-aff0775410eso235670966b.0
        for <workflows@vger.kernel.org>; Tue, 09 Sep 2025 10:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1757440751; x=1758045551; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=urPTHi+HPKECqvpnFYRbpEebbKe2TRaFUwc8ISijTfs=;
        b=Ypbez8D+DGNbH51MrDtf8znbtU2dPqE/VEZEP3Z03VF+4vo6a3niW/+rZzIZ1Hf+DN
         1Wlw5GdIFWrZEV/X/6Y9r9xgp0qalETFXe2zRZgMaXZ2u4ZNzL09HmtNtRN5nwWMiro7
         8i6+W322T8kuIc642DjTNwF6amtdUXRc0+V5s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757440751; x=1758045551;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=urPTHi+HPKECqvpnFYRbpEebbKe2TRaFUwc8ISijTfs=;
        b=DGVuJLdo1sZ0sXIAE/zlq03Z+Y5cUT7cywnNYU/M08OYnoW0NkflmdjeIEcBy//0+w
         QjKFPmh994cLYkbK71bZjQ8u1sC6ZNzIVq0gYM0H3N05gCZObpzD4/3fXmLhKXtLypUi
         7gKQiXJEI0+otfzPsdM5p1V6wf3FV8E7gqIkE7S1RfLDdByJqIBLfIw2PC+mh3PDiZ/9
         i67gUAI6i10e9P5OeCaoJqcTOlp5ya1z4QB/+Y7LbBa34/uWd7UQeFD8SgBI6GfTe+sZ
         7ZxfNqf8K9/LM+paGcUsnHFwkpRmv8zzfTNtdufMmVRRzq9tE78idwBnhBNqm+5o5get
         dKxg==
X-Forwarded-Encrypted: i=1; AJvYcCX4he/soD7KQnJCwkIbDJgJ4IzbpiHv3xVV5Rc5B4JirlFk8+xxeszlMy/eeOE+zx8XqzYlqppZbQM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwsmEAhBFOYorFzvVX9CzQtVxPPHeRY1WCw04fyGRfNNgqmQ1U+
	wDPFL35+XB7FFe3IKpT09F7fV7XY5fvWWTecONPoq1Y9vvkSAEV+gPuVusALVqMPEU8Or0HXc2j
	RMoI97No=
X-Gm-Gg: ASbGncvXR7fgSI1LS8dYw/QftshbKXroo5h8gk/Wz3kt10oUHbYGIjYh+4XkUKOwk3U
	II3rLgltrcagL5zwJJvnFheQhKhVZskTvBbj/oelbiDDnrDGdtXOCpDIWtXxTk97xMrWVPtYRfk
	lvqMd7g/20ERIHyUW4proYpcUfAA9uGYq7DWG9COgc6V7LDuClecWruH21pC5iA91tZfdz9DqlR
	O+bGvff587zLj7BMfBMkneCtzg+azkIbAgPhMLKeTiAS2+Xew/geFdeWEmNVe7OTGH6QNC6ASNO
	6VJaatXsvxtSE0u/hkCqZ2fSu3omFdyHhO+bA2wd51FoAu51VxGRaoGtQfwXSzccFlXI1BiECtr
	bTU4VFh1yBeFw8dHBg8BxT5gwOFjvIrY+mxKuoy/WBZizC2fIl4D3dEmGtTaJkJXcxnmMpSJa
X-Google-Smtp-Source: AGHT+IHzxGA3tKfu+J59ltSq4Q+Ycy3GTwsknSEkyo3by66pcv4hie0QPKMB3uTC6M/uMJj7969ZgA==
X-Received: by 2002:a17:907:3e09:b0:afe:6648:a243 with SMTP id a640c23a62f3a-b049307ef09mr1920193266b.3.1757440751411;
        Tue, 09 Sep 2025 10:59:11 -0700 (PDT)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com. [209.85.218.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07834124c0sm25622866b.102.2025.09.09.10.59.09
        for <workflows@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Sep 2025 10:59:09 -0700 (PDT)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-aff0775410eso235662766b.0
        for <workflows@vger.kernel.org>; Tue, 09 Sep 2025 10:59:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVYNixb7zoR5tYWNB+ZBLNUxGEmlAWXMi6YHGsw7/ZwCc5L+SzNyHtauoaGzLV8dwTpynsGWM/Pr/s=@vger.kernel.org
X-Received: by 2002:a17:907:cd07:b0:b04:3402:391c with SMTP id
 a640c23a62f3a-b0493245ddbmr1713526366b.24.1757440749500; Tue, 09 Sep 2025
 10:59:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <9ef87524-d15c-4b2c-9f86-00417dad9c48@kernel.dk>
 <20250905-sparkling-stalwart-galago-8a87e0@lemur> <68bf3854f101b_4224d100d7@dwillia2-mobl4.notmuch>
 <5922560.DvuYhMxLoT@rafael.j.wysocki> <20250909071818.15507ee6@kernel.org>
 <92dc8570-84a2-4015-9c7a-6e7da784869a@kernel.dk> <20250909-green-oriole-of-speed-85cd6d@lemur>
 <497c9c10-3309-49b9-8d4f-ff0bc34df4e5@suse.cz> <be98399d-3886-496e-9cf4-5ec909124418@kernel.dk>
 <CAHk-=whP2zoFm+-EmgQ69-00cxM5jgoEGWyAYVQ8bQYFbb2j=Q@mail.gmail.com>
 <af29e72b-ade6-4549-b264-af31a3128cf1@sirena.org.uk> <CAHk-=wiN+8EUoik4UeAJ-HPSU7hczQP+8+_uP3vtAy_=YfJ9PQ@mail.gmail.com>
In-Reply-To: <CAHk-=wiN+8EUoik4UeAJ-HPSU7hczQP+8+_uP3vtAy_=YfJ9PQ@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 9 Sep 2025 10:58:53 -0700
X-Gmail-Original-Message-ID: <CAHk-=wh2F5EPJWhiEeW=Ft0rx9HFcZj2cWnNGh_OuR0kdBm8UA@mail.gmail.com>
X-Gm-Features: AS18NWCMkQq-AHmRvXW3fe5pqZS6l4P8uIcvsgrr_gFx3AOIK1O6iaGHEGYcUd4
Message-ID: <CAHk-=wh2F5EPJWhiEeW=Ft0rx9HFcZj2cWnNGh_OuR0kdBm8UA@mail.gmail.com>
Subject: Re: Link trailers revisited (was Re: [GIT PULL] io_uring fix for 6.17-rc5)
To: Mark Brown <broonie@kernel.org>
Cc: Jens Axboe <axboe@kernel.dk>, Vlastimil Babka <vbabka@suse.cz>, 
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>, Jakub Kicinski <kuba@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, dan.j.williams@intel.com, 
	Caleb Sander Mateos <csander@purestorage.com>, io-uring <io-uring@vger.kernel.org>, 
	workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 9 Sept 2025 at 10:50, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
>    patchid=$(git diff-tree -p fef7ded169ed7e133612f90a032dc2af1ce19bef
> | git patch-id | cut -d' ' -f1)

Oh, and looking more at that, use Dan's version instead.  You almost
certainly want to use '--stable' like Dan did, although maybe
Konstantin can speak up on what option lore actually uses for
indexing.

And you *can* screw up patchid matching. In particular, you can
generate patches different ways, and patch-id won't generate the same
thing for a rename patch and a add/delete patch, for example (again:
the traditional use case is that you generate the patch IDs all from
the same tree, so you control how you generate the patches)

But patch-ids are an underrated feature. They are actually lovely, and
git uses them under the hood for rebases etc.

             Linus
