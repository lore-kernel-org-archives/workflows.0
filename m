Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CB1D24C076
	for <workflows@vger.kernel.org>; Sat, 27 Dec 2025 19:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766864763; cv=none; b=qO9bLeHzK9f06S8j68d1fC7Ln8bSl+YGTV/ksnnlh/+N6mX5r0HQlr3oma+3Ol5jHbs63VEZTpUi0yvVsEE0M3L14Vmv9aNgvaYbJrQubs8b88hc3L9kNkoo7YjUrVQeWyFSzqZVjq1btdVHEEUh/EjRRJOaiTIajQGzQzhjs3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766864763; c=relaxed/simple;
	bh=mdhJ4cXlrPcMZia6Gohyo0owEYrNH2ei7r+Oujb37wo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Yeynsa32OeS7nZKWAxkrsDnHdBIdvD6gb8Ega4iDXEFk75L44c1ob0o3qbqLJNuDPa3+IWdL6cDAdZibtqjVFoxxvb7ZXg5tpyhyM/IAyfVylLKXhYneeyJLFm/ciPqKgFjv+CSkOKWRIn2St2Aejds9HZ9AiCzqGTbRbt7d+1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QBOtmRo3; arc=none smtp.client-ip=209.85.128.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QBOtmRo3"
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-477619f8ae5so47901315e9.3
        for <workflows@vger.kernel.org>; Sat, 27 Dec 2025 11:46:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766864760; x=1767469560; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IJDlNzq/aPfe/Ir4VldH6hXmAMEznTovSG8sG1vFXN8=;
        b=QBOtmRo3eMAEG0DUfmtyUREh3C7v1w5YHMMprJfWjXynNi0FtHlI9+r74Z0+1uPXnk
         TKuGQ4v3xF7IUnsq3kKUu4oOkVkqWW/vw1an5xMJtkbWMxv+z2Zmv23DE7Xa+McyPpib
         pc8wdnk5nzCi+cZBA5VH1fdtV2NaVefaNL7du51CKUSRorXINrXC5PDUoEKyULOaU3RD
         Wwhgda7SU5MErm6uvclSx7KLVuq2U+ekM0YdK8CMvXqVeZvAIo57t1kmK+njz/2dCWk7
         M9K1IoNQrGUZG/vLTeDmZdUCYghc+4NvQd4+Ele1IHZwAoDfRv5L44JXlK65uHvQCY+X
         2MLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766864760; x=1767469560;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IJDlNzq/aPfe/Ir4VldH6hXmAMEznTovSG8sG1vFXN8=;
        b=G6NIqvHaFownSTpgD/DgYH06SJMKy6PVfHt2TZs6eV4AgvrEmwrYhOTIPw/ZoRsSze
         tg8Q6Xmy1SEduCVzFk7EXLQCCsfkMRsyXFFrk+NERjwl0rSzGcglgihdcxDp9BVa7FaH
         N5ef96EK+kmseGI7qFdfoQw0FbMEMDsxc2dx08LtyU0ogvXoK1yHDLlnkTvPIoa0VKSS
         G67EgIq54CLuPeZt0y5iQnvfXXZnnB4VfsgaM0/bHr6axrWBG/L9+TdH231/ZzScumhR
         dCuDTEK/+C/hPw7qRYR1YVs1zgG0htxQ3EQVNX2m5Nw0gUfPMlUzSuvoYqlrBmMqkB/l
         ++Uw==
X-Forwarded-Encrypted: i=1; AJvYcCWhBM2OjUWApsYnbJjauKrdnA9GXE7UDbUvoh4doZMU5ACpcvCn5D3MwlZIyaQq+SqAaf9Uy/sYhJ8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwvlE63RD8zT+1lIUBaxlbWrQP/qEB+DyPHyPlfkXCHt8da99x7
	9H8YvXPnJylXCZaj/cEkfUS9yzIzCqQUaPHr2g4cFOBln5AmIhcCCtaG
X-Gm-Gg: AY/fxX4SyB17h5EVqnUyn3rKhrL3a7igHqRU3dYdb5X8dkx/ckqSaNevV6ymqVwMLPF
	9nnrgZ+dHbqkMmefXwgTCpLGRk9sWqDiRbZA3yZmXyUd/srgHO50OMjwduCgvzYeh1r58DqsxTE
	DJWHdZy1/7VSODYpQLASjcg8zKxwE2gZVr7QwePf65+CWyNxM2id7GgGCKJ8mP5ntFZfUrREFdY
	z9eTYfY3AswkCwb2/6q9erzGUK/WL41/mGZwbLmm1sB2hBTyeMPLNX4Am/MwbI/S0qUAynyGdxI
	4Yz0LBZ6TUrPpXsrgIOGxR/tw+s12No60wH5wCxqxZL0JA9zmA4NmgAZGKUFEj44VP2CsCiPAka
	VdZ7bnL3K7SZerZ8VlwM6oPgID4nuyFW8GmNqk9Nr/cjTAAIe1MQpR/8CyCx09Xy1PxSU8U0RfL
	f3v6ncEA53scQVNMlcaW3Jmgk10ikLzaIBPtVdJj5GgdQkdHqkIwA=
X-Google-Smtp-Source: AGHT+IFDEBB02nDDy0klZ5TsmW8WBUI83uvKje+VJD1qoPLtOUz1hJwR7UCnJ56V1HWeDC0VGexLrg==
X-Received: by 2002:a05:600c:a31c:b0:47d:264e:b435 with SMTP id 5b1f17b1804b1-47d264eb68dmr196672565e9.22.1766864759564;
        Sat, 27 Dec 2025 11:45:59 -0800 (PST)
Received: from pumpkin (host-2-103-239-165.as13285.net. [2.103.239.165])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1aee5sm53837760f8f.4.2025.12.27.11.45.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Dec 2025 11:45:59 -0800 (PST)
Date: Sat, 27 Dec 2025 19:45:57 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Alexey Dobriyan <adobriyan@gmail.com>
Cc: corbet@lwn.net, workflows@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/9] CodingStyle: recommend static_assert/_Static_assert
Message-ID: <20251227194557.29d2afc5@pumpkin>
In-Reply-To: <c6f0c3d8-eb2b-49e1-b874-610fbeb248e4@p183>
References: <20250509203430.3448-1-adobriyan@gmail.com>
	<20250509203430.3448-6-adobriyan@gmail.com>
	<20250513204031.26f50209@pumpkin>
	<c6f0c3d8-eb2b-49e1-b874-610fbeb248e4@p183>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 27 Dec 2025 17:51:49 +0300
Alexey Dobriyan <adobriyan@gmail.com> wrote:

> On Tue, May 13, 2025 at 08:40:31PM +0100, David Laight wrote:
> > On Fri,  9 May 2025 23:34:27 +0300
> > Alexey Dobriyan <adobriyan@gmail.com> wrote:
> >   
> > > Linux's BUG_ON is done backwards (condition is inverted).
> > > But it is a long story.
> > > 
> > > However C11/C23 allow to partially transition to what all normal
> > > programmers are used to, namely assert().
> > > 
> > > Deprecate BUILD_BUG_ON, recommend static_assert/_Static_assert.
> > > And then some day BUG_ON will be flipped as well.  
> > 
> > _Static_assert() is broken by design and only usable for trival tests.  
> 
> It is not broken by design. I was going to recommend it
> for "static_assert(sizeof(struct S) == ...)" type of things. For ABI types and
> similar stuff.

As I said, it can only be used for trivial tests.
Checking the sizes on structures is one of them.

You can't put one inside a compile-time conditional and the tested value
has to be an 'integer constant expression' not just a 'compile time constant'.
In particular that means you can't use it to check constant parameters to
inline functions or variables defined within statements blocks.

When I was rewriting min() there was an outer builtin_choose_expr(),
_Static_assert() within the 'unselected' expression would trip.
That really isn't what you want.

So there are many places where BUILD_BUG_ON() can be used but
_Static_assert() cannot be used.
BUILD_BUG_ON() cannot be deprecated until there is a working replacement.
That won't happen until the C language group actually understand how the
language is actually used :-)

The _Pragma(warning/error...) are just as useless.
They can only report things detected by pre-processor conditionals,
not checks that rely on the optimiser to have deleted unreachable code.

> 
> BTW BUILD_BUG_ON is broken by design too, there are places with fake functions
> for a block so that they can put statement in.

It works 'as designed' within the constraints of the language.
The error message required a log of 'lateral thought'.
Some of the 'fake functions' may well be replaceable with something
based on _Static_assert() - but that is only a small number.

> 
> > clang also output the entire expansion of the conditional (even when
> > a message is specified) which can lead to very very very very long lines.  
> 
> Oh, that's very unfortunate.
> 
> > It isn't at all suitable for many of the checks in the kernel.  
> 
> STATIC_ASSERT could be arranged.
> 
> > Look at the signedness test in min() as an example.  
> 
> The very fact you all made giant mess trying to imitate min<T, U>()
> should not block progress of using standard (and better!) stuff.

There are other 'sanity' checks like those in FIELD_PREP().
Without assigning the parameters to local variables the expansion
of FIELD_PREP(GENMASK(8, 5) val) comes to around 18KB.
And that is a typical use - not the triple-nests min() that came
out as multi-megabyte and broke compilation.

	David


