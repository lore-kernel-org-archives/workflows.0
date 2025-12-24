Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75456328B54
	for <workflows@vger.kernel.org>; Wed, 24 Dec 2025 16:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766593440; cv=none; b=kd/djX70iCtqT0PIOnLnZALeWjxPbpWJpepKcee/xMHOc/FT6JV+YQnksoiXw+aT1s2VnX/LVJJ6G1auXhzOtcjQMMCX8DY++1hID5E8svjNFVe/2ey9qNA4hl2q+qikeQyjW7360AOqE15noDFNd/Ivl9sooqRNcFMfaEihmy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766593440; c=relaxed/simple;
	bh=7WV4T5nuWxBWWhHewV5tiqZjFlpfY8Yhcb5MtCObx84=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hYcZGbmi7LPfgnWNe+6NNqGk7aMvdAHXZsZe0JXIxqqUXAlZDZGD25gZ+T0vxH0SNMn5SjJoe5E6I9pgvsG5zcDZYmbAiwq7AQ6mu4ZiEZnYSGpCAdOt2QmsWh6crn0FlYuuqng79bQ81wSIAHPjd8ghusnrXN7zzy/0BbRQo/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=dW2BywAK; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="dW2BywAK"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b7cee045187so1081769966b.0
        for <workflows@vger.kernel.org>; Wed, 24 Dec 2025 08:23:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1766593433; x=1767198233; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=B+ZwzLNirOF+Nxyrl5IUrZXM9GbaHlaE6cKByPnKroI=;
        b=dW2BywAKodXBSp+23YmrguRlVg5QD3pviCppTJQfbeNm2vTlaZn0h7lcoC1PBsG7Hg
         nzIPbtCxBr20+Jyv3yJCqOlLeqJ+zXLSx8pnxZKaSf2UTpO0amdW+kKBRAU0tYsGxbGh
         vgOxMCyfio8TR67Q0J8OKEDw+yLotND8M3Wwo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766593433; x=1767198233;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B+ZwzLNirOF+Nxyrl5IUrZXM9GbaHlaE6cKByPnKroI=;
        b=Q4y6ag5igCleL5tWkMWGPZDRihzZ8OEZEH1tDadAuP1rzmsEDNaNAerbkYRDC015gN
         URqYLB7/Bf8qIbjRZp2zylf9dBz6CbVg6AZm+H/Ooi7BaDiBsdm50N+2J6bhDOKrmWg7
         T6aNpYj/wyPOAult7bh7N4SahVgucVkxRjQ/vR2sxensWRFjKDeZLQo8/3zxV7cpWc/c
         tU7ovxoo15gQiqDdmCBAohrVImohhXZequ8NwMh1vYiZfYaqFnsSwIQyc97XzKda/+Mr
         cnYAE2S/aeM1mMyJCAy2DuNhSMI8HfH6tvHgwhxcPMt5YyTaAMn9kOo9O+1u+ET0NHzU
         HIpg==
X-Forwarded-Encrypted: i=1; AJvYcCUg/CqFyKXCQRqEAtJWPheL2szQXumlkjKtyJ8iEePES/wi2y0ez9nDnYMNmP/GA6TMny3XCwjoaQE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+OP9T+phas11zEQm5I6MrSB7KmR3BEXJsuuTXUvxH41+CICZc
	RJw4R8u+BwixTaBlpkYz9QiGspncTgB/Op+Vk2l7CXMGxuVDDXdJCfESrw5OovNXGy4wMl7V+gQ
	UBZmy+rWvgkHlvGchI3o9vGyccaoZyOnetKx77Jxl
X-Gm-Gg: AY/fxX5qstmSRq+jHv8EgAGyItMVkABlVuk5lleE7b1XCXI3Q3lvNdD584Xc8NeDdLz
	scq/zJXZliW8JrBlPwpIYymTkE9ZFoLgjkuNWBvEhBJl0D11DaiCcWHfLGaiSvSf7tBkUIJOh4u
	9lUnhCYLXyww2tAULw9k2mypHoWQEA+ezf+m/UFaECWh/60Q9SIYdG06da6a/iStC9y9qIZ/Nd6
	R5RWt4Tgq/RUTve5AK+7m6Wvk8W0udKjdqgy5O859bTSIumkJinazzqja9U7k94NCnkhg==
X-Google-Smtp-Source: AGHT+IHrab0+kO4y0JQH91dach7KFNzglk360nuduWGFeAfxIGSG1kEXAf/RL4F8aIqSzYjSylJ87f0JC2QNWe99oEk=
X-Received: by 2002:a17:906:30d4:b0:b7c:cc8d:14f4 with SMTP id
 a640c23a62f3a-b8020400995mr1822714466b.4.1766593432970; Wed, 24 Dec 2025
 08:23:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251114183528.1239900-1-dave.hansen@linux.intel.com>
 <20251115140746.6a3acfd5@batman.local.home> <877bvqan70.ffs@tglx>
 <2804290.mvXUDI8C0e@rafael.j.wysocki> <EEF974E1-08D5-4E67-8AC4-4315CF9D10C1@kernel.org>
 <20251116111732.5159839e@batman.local.home> <2025122358-flyover-tidy-6f4d@gregkh>
 <87a4z9w2dl.fsf@trenco.lwn.net> <20251223155652.7c52630e@gandalf.local.home> <d0903ed7-e2db-4d8c-ab7f-0beb84760f07@sr71.net>
In-Reply-To: <d0903ed7-e2db-4d8c-ab7f-0beb84760f07@sr71.net>
From: Simon Glass <sjg@chromium.org>
Date: Wed, 24 Dec 2025 09:23:44 -0700
X-Gm-Features: AQt7F2pPYuh-Vujbi48OAsni9r8b11fc7mGCDi8cjVLkwuPwny1V9yiTwFwNa-A
Message-ID: <CAFLszThGBdc9TOen9=hgkNQOhDUoRZgpj4QHts4we+_J7JuQBA@mail.gmail.com>
Subject: Re: [PATCH] [v3] Documentation: Provide guidelines for tool-generated content
To: Dave Hansen <dave@sr71.net>
Cc: Steven Rostedt <rostedt@goodmis.org>, Jonathan Corbet <corbet@lwn.net>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kees Cook <kees@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Shuah Khan <shuah@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, NeilBrown <neilb@ownmail.net>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Dan Williams <dan.j.williams@intel.com>, 
	"Theodore Ts'o" <tytso@mit.edu>, Sasha Levin <sashal@kernel.org>, Vlastimil Babka <vbabka@suse.cz>, 
	workflows@vger.kernel.org, ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, 24 Dec 2025 at 08:47, Dave Hansen <dave@sr71.net> wrote:
>
> On 12/23/25 12:56, Steven Rostedt wrote:
> >>> What's the status of this patch?  I don't see it in linux-next, is it
> >>> supposed to go through some specific tree?
> >> I've been assuming there would be another version after the meeting, so
> >> haven't applied anything.  (Besides, between travel, 100mph winds, and
> >> several days without power, I've not gotten much done in general...)
> >>
> > Yeah. I was talking with Dave on the way to the Kill Bill evening event and
> > I believe he was planning on doing another version sometime when he got back.
> >
> > Dave correct me if I'm wrong.
>
> Yup, I was just waiting to post again until I know I can be attentive to
> email and responsive to an reviewers. It's definitely not dropped on the
> floor.
>

Reviewed-by: Simon Glass <simon.glass@canonical.com>
