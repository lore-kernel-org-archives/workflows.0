Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34BEB4921BB
	for <workflows@vger.kernel.org>; Wed,  6 May 2026 15:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778082391; cv=none; b=B6WyeJRUdiMIUWrdjokkrl+uSpogc2F85efJKnujdLqFwZ3Na8cMtpX+U3kITCUrbKqlUOLK6hvhUR/d81sAh1v4ofShKxa/sEjg0+Xc3ypkTkYcHJu0kquBxQJ2EaPyskijgsdPF7zLFAxrujt+cJaBVPA/8J+n7ogJee5x6Yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778082391; c=relaxed/simple;
	bh=Ayxe0U7sEqVbzMNuLfhkgTWqSkvKWKIHUAFfGG7sBVQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e2SONeX31NVyyLtpvdCuhY9IHr2hJIAL/sl0dEA4bJc2mGELlLia/zVTR8/miVZZ75mPYMOsYeOLVnJ5PLFHShbbP1tCmYl9FbYK590aOBg3F7ggjKUhkVeSi6a/jAfQOHoy1xGa6SS+vZmo+glH4ZOjasdlYvNxet5SQH4nOnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=cqUzvWBC; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="cqUzvWBC"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ba3115fe0d5so204277066b.1
        for <workflows@vger.kernel.org>; Wed, 06 May 2026 08:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1778082386; x=1778687186; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ol9I+25i/wXqaqCu9UMZW182j7aLIrDgRKl0RhfiK4Y=;
        b=cqUzvWBChdnUJgGm7rt36iygjfcziAZy64oQFGIxfgERvh2P9y+zqjKEuh9O1gLwQr
         ufL0O9urnjGYUgA2OxpURTdCcPrT2GmN9pN0EAtmV1x4kuvYndbJOIxBGHV2z/ydJM3U
         I6AEiGeAYlYOJepjqf1zhqevae72dUuOKPXu8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778082386; x=1778687186;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ol9I+25i/wXqaqCu9UMZW182j7aLIrDgRKl0RhfiK4Y=;
        b=CzWDHNhpUweMFZpGdxzovyY+Hlnn/CyoXm56n4p22Tld3LmyVdbyxH0joUC4ijXNva
         Md23e0wg3/i1a26k2bDl3Ud7/uyNJsYJyfpbdWcB22bxezfIHr7kvX9E/lbzSiBuQpXO
         lSp45qL9++lYFYSxlz4EmMAuM6g1DsBupw36XrJdj1M5MU/5Y0MaIaiwSht14wFITtRY
         JojQ46Sxly8G7Ajid7fBwSNiy38GyD+e0m1PjXQwQ3jWNL+CiiETQ0ln3fhN7fOsIhIf
         P9I+lOv4Hvoh23mM9IFHmjRgBRZZkKo+DWzO7otXskeKZiR08oCmMOAK2Yugi3RIh23g
         KpSw==
X-Forwarded-Encrypted: i=1; AFNElJ+Xdvzb7srwzTnljYHEwBMrC7Tcx2EA7kQgRxoHo+N0Ib5BlwURBxmyYRoRT6h4ptUKQBj91kPFirY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzHWo4CjMi+eQl5GP2qymgebunNU+viBnufJjY/Bpwli5XA+nSJ
	fbAN+YkVUpZdSLLtRCb20T42Jm7tW7apOLcuxP91wG2/vFeK9499xpxxeutMS9i7wj1SxxC+hkD
	DFc7AIqw=
X-Gm-Gg: AeBDiesdzDMV8WUC9bSNK9lu6buZ3kO5AU7gO7DNouJqGQ60l89YsL/q87GQzbdF0qQ
	8OUDYL83yO8aXLyZP+EGVjk7KuGG9CbCN1kpgg4XX1QlQmmy7nqT2OHJn5L+D36tyUSQ+hVnfXX
	rrSNIFVehwB94Z1kb7j6ai0s3BJ+f99m5yedM8wL3SXDbIeHE7divnsDRnbKGxWR5GXC/PJjYsv
	//1iPSj4WchbOISYVccOTB0onE7p/UO4cHPOL2lCakJUvlAYQHE8U1NAwmOb+XtBuvIANOBIwKS
	djMgJ7HOxV0NYcJfQHucYioY+IfLm+cBz/FJ3GDDFUTujFHQo0mWExqr92sE0i59+oetYKO3Qad
	Ql/Jzl8b8B7vd2t9iOouR3oCYFhfqzCQrMhIslh/d1donoNy6NvlnhWDhLooKNKsv5iIG74uzjT
	8sIz30eNYukkyrdDMu8pDhkmbaWoCVm3vNcqHLIyPbCukh99hg86D/TJB4mS26q5SF56QPIQyha
	SFONksc+6H9fPjjqvQj
X-Received: by 2002:a17:907:97c7:b0:b9e:8d2:1eb6 with SMTP id a640c23a62f3a-bc3d1854d5bmr394975766b.27.1778082385603;
        Wed, 06 May 2026 08:46:25 -0700 (PDT)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com. [209.85.208.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bc55f215469sm106408166b.53.2026.05.06.08.46.24
        for <workflows@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 08:46:24 -0700 (PDT)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6763cc8775cso1912865a12.0
        for <workflows@vger.kernel.org>; Wed, 06 May 2026 08:46:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9Mt6XTgG73HLFHfF0+rafF9jiQb32vY/yjyvlN/LPXW9NNbeqR6fyhebtHNtH/KcqOrgGGVbRj/Jc=@vger.kernel.org
X-Received: by 2002:a17:907:9448:b0:bc3:99d5:a29f with SMTP id
 a640c23a62f3a-bc3cf833b05mr437230666b.5.1778082383735; Wed, 06 May 2026
 08:46:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260503113506.5710-1-w@1wt.eu> <20260503113506.5710-3-w@1wt.eu>
In-Reply-To: <20260503113506.5710-3-w@1wt.eu>
From: Linus Torvalds <torvalds@linuxfoundation.org>
Date: Wed, 6 May 2026 08:46:07 -0700
X-Gmail-Original-Message-ID: <CAHk-=wi6z5BGUUT2p+=qrJg+obom8VnCo3MqB=7xp3Gw+UMMkg@mail.gmail.com>
X-Gm-Features: AVHnY4KE50QWidq7jluJrSAvjRbAdXhycVxJcJyr74qo1PmiGMyRuavPyHIA4oo
Message-ID: <CAHk-=wi6z5BGUUT2p+=qrJg+obom8VnCo3MqB=7xp3Gw+UMMkg@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] Documentation: security-bugs: explain what is and
 is not a security bug
To: Willy Tarreau <w@1wt.eu>
Cc: greg@kroah.com, leon@kernel.org, security@kernel.org, 
	Jonathan Corbet <corbet@lwn.net>, skhan@linuxfoundation.org, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Greg KH <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"

[ Coming back to this after a week of trying to clean up the disaster
that is my inbox after the merge window ]

On Sun, 3 May 2026 at 04:35, Willy Tarreau <w@1wt.eu> wrote:
>
> The use of automated tools to find bugs in random locations of the kernel
> induces a raise of security reports even if most of them should just be
> reported as regular bugs. This patch is an attempt at drawing a line
> between what qualifies as a security bug and what does not, hoping to
> improve the situation and ease decision on the reporter's side.

I actually think we may want to go further than this.

I think we should simply make it a rule that "a 'security' bug that is
found by AI is public".

Now, I may be influenced by that "my inbox is a disaster during the
merge window" thing, but I do think this is pretty fundamental: if
somebody finds a bug with more or less standard AI tools (ie we're not
talking magical special hardware and nation-state level efforts), then
that bug pretty much by definition IS NOT SECRET.

So why should be consider it special and have it be on the security list?

Yes, yes, I know - some people think that "security bugs are special".
And I've been on the record before calling that opinion special - in
the short bus sense.

Bugs are bugs. And not having them in public only makes them harder to
deal with.

Do we want to make bugs with potential security impact harder to deal
with? No. No, we really don't.

So I claim that the only reason for a security list is the non-public
nature of the bug and the whole "responsible disclosure" argument.

But that argument is complete and utter garbage in the face of some
mostly automated AI discovery (now, that argument is mostly a fiction
in the first place, but I am not going to argue with people who have
vested interest in making their special  patches "security bugs").

To recap - I think this "document the scope of security bugs" is good,
but I think we should go even further, and just document the fact that
anything found by regular AI tools should just always go to public
lists and is simply not special.

                Linus
