Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F5CB36D
	for <workflows@vger.kernel.org>; Wed, 28 Feb 2024 00:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709081011; cv=none; b=mUq1PsWnIVOEaxcugm3qgKDl4T8HVUE4XZDVQj3/68HbVA6noeQlWJkETznUNETgXtzgHz6mU+efhI0ix4Rb7WLi1V+VDxIRecoBsbHYmTGzsWi/DQiAMAqY1k02KQpWga5JAT4hDJzZ3ziaR6rhgzeK788HK/6o7wpeUgslaDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709081011; c=relaxed/simple;
	bh=cA+fnwnt//J3NfdO7+rLKW9APEqj65IbB51Mwl9Kg0A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xv3TBjWQJ9Y4G9CConAkPP4ycTamfY2mUcVPYe/lsXNBN05UZhlr8pi1eiUOgNEeu2pdRrxWT6DAXnaMyc2P72iu1ylNGOq/yy8xhRkNXlxluYcR2F3bJS4jvgMZhuLkKWzFDL6pyeZM7Aj9v69HLawTG7t5lkfoXkqPvkrTs3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=hes5Y+Gk; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="hes5Y+Gk"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5655c7dd3b1so679009a12.0
        for <workflows@vger.kernel.org>; Tue, 27 Feb 2024 16:43:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1709081007; x=1709685807; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4R0JEfuygzXs74mV0uReUDXdjYhtO4vO7wERenZVrWg=;
        b=hes5Y+GkRvMwb8HVGDJa81Kj2ktOh8wV/BL3EG6lcnHtHnSD2SFvCMTwuEyDoFb2bg
         eRUgKd4XrdNr5Fl0azz1kzyhhssf3dmO+i1Tgz+BrdFdaR+jnzSGJGEAwUBNIzDX5j+H
         lfGycTRkVsa/MFzX8MKKMBWIMkbaBCFpEBF6c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709081007; x=1709685807;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4R0JEfuygzXs74mV0uReUDXdjYhtO4vO7wERenZVrWg=;
        b=B3Z2reGcsVT8V4ElKAMR7PwmR9lJGwqHSPyTeJfmFBe+d8t5iQTGCvFuC5zc2Ek/5j
         zv14APQTB9NQhr0jzHCFpYZCGcEasMYFWmAzHare/OmTQkqnT9SYLsA2UU8hG81urnM7
         tG44Mo/Y3xUdc2nb/jDVVYQw+Xw0pIU0Zc4C4BXU9bRqPy+xjOuc2KqDCpuv99Nkudmb
         0azYRmmKNSxg3b9m3rIm70q2EltQOotB9za7BGm1Vd6Ez/4WgBgR8mcW/3dyLzKDmHcY
         80rxjPV3d/mZgfJodgKXQYwUAd95BwMt/0hUi6S8ZtixafrNXrndR6POCWiO5x7EtAJB
         tUHQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/yA2phm+Ya6RrV3Q310s4uSDO2p+Wo1Qd63a7TbLhmo2E5pjOVO6RqPoHClt3TIv4/48KaCzJ1EHc+7mP7t5qRpr3lXeoKyfF
X-Gm-Message-State: AOJu0YwIFB0hsjLBE/4/utzTx168Piqp08Jtk5UszYsPX+46WRZuXFm6
	NAV57oVOwbme21u65gkn80xnBUNtMhgNCotI/ZeJiHif57YMhRE2D9dyqgOFA2OveTrg9GvQ07H
	43lMWcQ==
X-Google-Smtp-Source: AGHT+IEnaAJA3qNyz8vzZbaDM9dJ+oKkyHoQyGUpZEyO+H7wKxxERpHaTMv+tpNbpbhbfaq0LObDPA==
X-Received: by 2002:a17:906:f295:b0:a3e:6bd4:9ac3 with SMTP id gu21-20020a170906f29500b00a3e6bd49ac3mr844274ejb.11.1709081007494;
        Tue, 27 Feb 2024 16:43:27 -0800 (PST)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com. [209.85.218.52])
        by smtp.gmail.com with ESMTPSA id h5-20020a1709063c0500b00a432f3bc3a5sm1281462ejg.76.2024.02.27.16.43.25
        for <workflows@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Feb 2024 16:43:25 -0800 (PST)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a3ed9cae56fso61967466b.1
        for <workflows@vger.kernel.org>; Tue, 27 Feb 2024 16:43:25 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUNZ54dmGYozWQJ3omY82hhL+HpQelMYPDZkkLE1OYHGcNDrO4YruCXNcOr7e/TnKsBPIe28g+aSyF/Q4nBZesJF+IMosX51X8k
X-Received: by 2002:a17:906:4557:b0:a43:1099:7e72 with SMTP id
 s23-20020a170906455700b00a4310997e72mr772552ejq.35.1709081005598; Tue, 27 Feb
 2024 16:43:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240227-flawless-capybara-of-drama-e09653@lemur>
In-Reply-To: <20240227-flawless-capybara-of-drama-e09653@lemur>
From: Linus Torvalds <torvalds@linuxfoundation.org>
Date: Tue, 27 Feb 2024 16:43:09 -0800
X-Gmail-Original-Message-ID: <CAHk-=wixuZ3SwabT69MEt6=c7hTJ=s4ptVDSD6UKtP+iBANy1A@mail.gmail.com>
Message-ID: <CAHk-=wixuZ3SwabT69MEt6=c7hTJ=s4ptVDSD6UKtP+iBANy1A@mail.gmail.com>
Subject: Re: Toy/demo: using ChatGPT to summarize lengthy LKML threads (b4 integration)
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: users@kernel.org, tools@kernel.org, workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 27 Feb 2024 at 14:32, Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
>
> So, the question is -- is this useful at all?

I find the demo intriguing. Useful? Who knows, but the potential is
certainly there.

The summary didn't seem to take Rafael's last (fairly strongly
negative) email into account as much as maybe it should have been (my
first reaction was that maybe Rafael's last email hadn't made it into
the summary, but going back to it I think it was there, just not
nearly as forcefully as Rafael's email read to me).

I personally would find it more intriguing still if it actually
reacted to the code instead of just the discussion, but I suspect
that's still some way away.

IOW - interesting. But hard to tell how useful and how maintainers
would actually end up using it.

Would it be something where when you bring a new developer into a long
discussion, you'd introduce him with a summary of what has gone
before?  I'm not sure what the use cases would be in practice.

           Linus
