Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 687E22FD1D8
	for <workflows@vger.kernel.org>; Tue,  9 Sep 2025 17:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757440245; cv=none; b=CwYQ1ZTaD2GumLQRQFIBndmsj+87wQ82YXKMFIRJezUvJFYUS9OL68uAsq0KvwvimjarDWI75mDzNnT6cnaSWxsQKjUs0dWjgIAcDRhEimuFbR2c1BPL/88DJBuSE3k8bc7Zl70UfaJRC4WlwfphedYN+CDvUV10aICWRcEKoa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757440245; c=relaxed/simple;
	bh=PficCqT+rEbrs5pcKADEXtmjS2T6Jp/bREqqflB7AEk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s7zB8r1iBpRCDrM9VBM8KEpWP+pT6q5gCULWuTmfS83dJlEsjPP8ly2DdnAs4Zhbd2UGEm9Nty20tHWYvKCJXKCPKfy1zdjCCBE9Hz1c5D2ip3X3xCrsvgn6w5cJNZtx2IxNcMEB4SRQJ4dVb4nex0O/7RooGlra/L4cCoq+/P8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Fj7JCYlI; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Fj7JCYlI"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-62598fcf41aso5065531a12.3
        for <workflows@vger.kernel.org>; Tue, 09 Sep 2025 10:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1757440241; x=1758045041; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Q9ayI9RafIVeDOxPGUeZSrHU9WK0+PURxl43r1e78tQ=;
        b=Fj7JCYlIfofOf3tT3FlFoc5S/TBlm/nRh6wnnCNXThtBeN0WMTVuzGu0GttV6Ub3Pj
         1Tf44WbDmjBNCF7f0QmHn0MV0BVQ6uoBLtHAxeIO2Vmv2JEMIFqliL2uj93tfRuzU6QK
         VS6k6Ec7Kci+GmKB2Vk+64KgUVR1BDlD3Ng5k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757440241; x=1758045041;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q9ayI9RafIVeDOxPGUeZSrHU9WK0+PURxl43r1e78tQ=;
        b=QGm569z0y3pOSVMcv9x7epAHaulamPr5MpBbHiIFpJruGv40QlGzaWG0Arpnl081zF
         zzLCbAPG0y1Mnonm9yuP7K9r+vWBuy195Fvv0KpONH0Klcd/k/0VR/H5GAH760q+Z2bk
         Do9EKFxjzvSXThakEjk0Eceu69l3h5SzTeUG2s1nwvzhBmHExSeauTkyvdMpVlJWExMI
         cPbKKWYa8P6KJkIPgPxnRyZuX06gqlcDlXM3+et5Mc/p4YpJR/uMVMwV70Cy0Z8vuAuE
         gUT/stVawLvNyzba6s2Pr7oWolZrN3P6Kn0VRYrfhwNzxSfZUXA7cf8ap1JMc4B65Fdn
         3o7w==
X-Forwarded-Encrypted: i=1; AJvYcCXApc7xMNqKmZf/rTXFvq+rXYJa10KR32QNuU+eD6MO0Mqwaw3iG7+Hhr/nfTamWv7GZOp5jgQeWKA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8jyz1Q9h9QbyAoH9UFbUssb8wBGXOi99ngOs1epj01bSekjMP
	2oOWsU0dW5X4GZGIiaM/rkfvavwjVEDCsWVom1RwGWdIunMm42uEwsXTKGjwOuGd+l1Ucvgma8z
	tMUCJp6w=
X-Gm-Gg: ASbGncsOkofwXuzeuxWJ15r6v3/dOcYou5U49CVvd6j9uzgR0jPblQpUIOHp+OSIpt6
	faOS6xQugDZzOfKFpWYC8YOj/r31dwr9j6Tfe9gTsG3b7eEF09L0x8Ee9GrpUPD99x8oJo4rXYP
	5OmkQaj9+GzIpQwmOizz19UW+E8UmqY5xKKZfUfLyuzT31pQTg6hUfrk2U+iK6yFDZu1lJaDWrv
	jd6BKLS1BMasYm2LOcHVu+KVxuzwQLCLAr2kQnRUA0ZqCyCiviah6liNqTVEc78x+1NvgkOW74i
	uAkvG/4RXxr2JJi9HzBegFgo/VV5wnhUHeyEpGcfpMLARYoUU75lQHD/62t0thMPmZkD9EVpYvP
	n9E0SWpUgtz1GvadEOZunmPE4Ofn4HvNvfE3AtAbthWJqKee3so8YE04AYHH2zY7oGpulytvM
X-Google-Smtp-Source: AGHT+IGxlf5RaysRglEYY3NyD8gpo85J95HBTPvbDk/wpNQDhJmZaQJgOiYSCaPCMBjbJbhK+/uA8A==
X-Received: by 2002:a05:6402:51d1:b0:62c:9c9c:fed6 with SMTP id 4fb4d7f45d1cf-62c9c9d00damr1569012a12.8.1757440241476;
        Tue, 09 Sep 2025 10:50:41 -0700 (PDT)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com. [209.85.218.46])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-62c0123f0b4sm1523086a12.24.2025.09.09.10.50.39
        for <workflows@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Sep 2025 10:50:40 -0700 (PDT)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-afcb7ace3baso1021514866b.3
        for <workflows@vger.kernel.org>; Tue, 09 Sep 2025 10:50:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW6ZaxPy/NR90/wALmLBF9RP+81ayAa6G3S77hUcow7BHHJ7ZxEE3S7UU+KXQBeAhRNMmclD5SwhjE=@vger.kernel.org
X-Received: by 2002:a17:906:6a1d:b0:b04:4175:62f7 with SMTP id
 a640c23a62f3a-b04b1687ceamr1313344566b.33.1757440237933; Tue, 09 Sep 2025
 10:50:37 -0700 (PDT)
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
 <CAHk-=whP2zoFm+-EmgQ69-00cxM5jgoEGWyAYVQ8bQYFbb2j=Q@mail.gmail.com> <af29e72b-ade6-4549-b264-af31a3128cf1@sirena.org.uk>
In-Reply-To: <af29e72b-ade6-4549-b264-af31a3128cf1@sirena.org.uk>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 9 Sep 2025 10:50:20 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiN+8EUoik4UeAJ-HPSU7hczQP+8+_uP3vtAy_=YfJ9PQ@mail.gmail.com>
X-Gm-Features: AS18NWBdgXLEGA42KiP7hBpdYuD5iEhjlm5va7PappHV7NFwUOo9aBTGKqi-tac
Message-ID: <CAHk-=wiN+8EUoik4UeAJ-HPSU7hczQP+8+_uP3vtAy_=YfJ9PQ@mail.gmail.com>
Subject: Re: Link trailers revisited (was Re: [GIT PULL] io_uring fix for 6.17-rc5)
To: Mark Brown <broonie@kernel.org>
Cc: Jens Axboe <axboe@kernel.dk>, Vlastimil Babka <vbabka@suse.cz>, 
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>, Jakub Kicinski <kuba@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, dan.j.williams@intel.com, 
	Caleb Sander Mateos <csander@purestorage.com>, io-uring <io-uring@vger.kernel.org>, 
	workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 9 Sept 2025 at 10:08, Mark Brown <broonie@kernel.org> wrote:
>
> That works great for pull requests, but it's not so useful for a random
> patch like 5f9efb6b7667043527d377421af2070cc0aa2ecd

Sure it is.

The one-liner is just different. Use the patch-id instead. See Dan's
email - and the whole long discussion about how lore *ALREADY* has
most of this support.

Yeah, the patch-id command is admittedly a bit more esoteric than just
looking up the merge parent commit.

Using "git rev-parse" is already a bit obscure (although honestly,
it's a really useful command, and I actually do use it somewhat
regularly from the command line).

Using "git patch-id" is definitely in the "write a script for it"
category. I don't think I've ever used it as-is from the command line
as part of a one-liner. It's very much a command that is designed
purely for scripting, the interface is just odd and baroque and
doesn't really make sense for one-liners.

The typical use of patch-id is to generate two *lists* of patch-ids,
then sort them and use the patch-id as a key to find commits that look
the same.

That hopefully explains why the patch-id behavior is so odd, and not
really suited for using directly on the command line.

But my point is that we really have the infrastructure already in
place, and it's better than hardcoding some broken link into commits.

Now, I don't have that commit you mention (I assume it's some recent
commit in your own tree), but I picked a random commit from my
top-of-tree that contains one of those useless links, and look here:

   patchid=$(git diff-tree -p fef7ded169ed7e133612f90a032dc2af1ce19bef
| git patch-id | cut -d' ' -f1)
   firefox http://lore.kernel.org/all/?q=patchid:$patchid

and it's right there. It finds the stable tree backport too, and if
there had been multiple versions of the same patch posted, it would
have found the history of it all too.

Look, I readily admit that I would never write that as a one-liner. In
fact, I got it wrong the first time - I don't use 'cut' often enough,
and I forgot that the default delimeter is 'tab', not space, and got
garbage.

So that 'patch-id' generation line is just crazy line noise. I'm *not*
suggesting you do that.

But this kind of thing is literally what I'm talking about when I say
"maybe we could add a few scripts to support what you are doing".

                 Linus
