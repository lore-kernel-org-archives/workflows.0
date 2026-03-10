Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F10F389470;
	Tue, 10 Mar 2026 11:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773143211; cv=none; b=C+nJVQRYBOo3XYUOfJeDKg3oAkyBiARSXQuwaPBmzMnWzkYEGwRCDeVOW2+2UbVgZ5prr5/mZv2UPW6Hn6NB/JSCYRoxlgWdMdDwYmw5MUA8Wz62Cw5cqVl4fg+kpjf9URcwONdOJM8n7ufymNlcfciouHRa+28Tz4NN2yTXGa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773143211; c=relaxed/simple;
	bh=BIaI4pxvN3V8hZ6jrwfCOPOEPfVNoeyv5Owc6cStavE=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=NnW/yR67qCcnGbuzbqj+zSpJL5u5ygXYiefs2tg7vCE0VjbsbHSDm+rdk4NoU4lKIP9+zaDyQjOqyYPVV/Aq5Nnj4G95443qvxlKZMNtl2Vc2i4C+ZwhTGiusDU8GfMqA44IaJZabBYYjZFtuTN2mL+DzRzN4ItqocNZ1/z9UZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=Bfqv8eBt; arc=none smtp.client-ip=192.134.164.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="Bfqv8eBt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=2t6z5P6Yw5ECQlab8vHB/iBc3NM0Xqd+9Y7CyIudIxg=;
  b=Bfqv8eBt1E6BLFOozhd8afz2tu5FQISf6S2M3cSlSV+qhHiujaB1+bU5
   rBPT0JJk8qtcryNtf0Mheaxgejfthp2b7f2wJLmiSF1Dt9MMD4Vjv5yS8
   v+6JS4hf7RLq1qUP08xfnh5j70PxyolPzxM6kbb/jZI1n/fLoq8jthiGp
   0=;
X-CSE-ConnectionGUID: vyTLVbA5RleEiTQdQVKUJQ==
X-CSE-MsgGUID: egfl0/axRqKYeQ9x3SHRkQ==
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.23,112,1770591600"; 
   d="scan'208";a="267079623"
Received: from dt-lawall.paris.inria.fr ([128.93.67.65])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 12:46:47 +0100
Date: Tue, 10 Mar 2026 12:46:46 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
To: Akira Yokosawa <akiyks@gmail.com>
cc: julia.lawall@inria.fr, linux-doc@vger.kernel.org, 
    linux-kernel@vger.kernel.org, workflows@vger.kernel.org
Subject: Re: [cocci] [PATCH] coccinelle: update Coccinelle URL
In-Reply-To: <793c8771-83ab-4e6b-811d-41fd54b78e3a@gmail.com>
Message-ID: <c94cd15-2052-f746-ae38-304b4d838486@inria.fr>
References: <7db99952-d1ef-7148-4c8f-1e6ae8f0d875@inria.fr> <793c8771-83ab-4e6b-811d-41fd54b78e3a@gmail.com>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Tue, 10 Mar 2026, Akira Yokosawa wrote:

> [removed most CCs]
>
> Hi Julia,
>
> > On Tue, 10 Mar 2026, Julia Lawall wrote:
> >
> >> The LIP6 URL no longer functions.
> >>
> >> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>
> >>
> >> ---
> >>
> >> I used the UTF-8 encoding for the email.
> >> Let me know if this was not the right choice.
> >
> > OK, this doesn't look good.  Sorry for the noise.  What is the proper
> > encoding?
>
> Encoding itself looks good, but your patch has this in its header:
>
>     MIME-Version: 1.0
>     Content-Type: text/plain; charset=y
>     Content-Transfer-Encoding: 8bit
>
> , which should look like:
>
>     MIME-Version: 1.0
>     Content-Type: text/plain; charset=UTF-8
>     Content-Transfer-Encoding: 8bit
>
> Didn't you say "y" to git-send-email's prompt of ...[UTF-8] ?

Yes, I did.  I thought that would select the default...  Thanks for
letting me know.  Should I send it again, or is it ok as is?

thanks,
julia

>
> Thanks, Akira
>
> >
> > thanks,
> > julia
>
