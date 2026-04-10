Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42F313DB65F
	for <workflows@vger.kernel.org>; Fri, 10 Apr 2026 22:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775859143; cv=none; b=gzpyp2r53a/+LpSSrl/d+aXCPdaiVvt7gCRh7rDBU4D37JhISOcffqobTEnyoLJWKR//f7M+jSGDKLgF7ujq0YGPUm7/jYivoyb3K2J1H8S05yEhUPZv8Ak2l+rloUzmgTToXnfaPd1El02DxCCZIUjj78fvQIvhuIV5lTnFQB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775859143; c=relaxed/simple;
	bh=BYCH3vDBRAX3ehfhBG/Wmpxnwa8fywE0iX7ey0b+65E=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=JETbRIVntEb/BI7dTUebtlbkvJ4WebtcBT5MqEYgXLmXQSh/iblRmViEub13R++FQznKil9aSiEGU28rfGJAi8hXA271eS3JcqUege14uiGN0bLc4XrfY4P7QyYoDsxzwlk/b3kqL9o5tA8Ota60hg34LdYEVr1Xnpq25Tpv6RY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tDUWTG2+; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tDUWTG2+"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-3594620fe97so6794726a91.1
        for <workflows@vger.kernel.org>; Fri, 10 Apr 2026 15:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775859141; x=1776463941; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Lpw2bwte44HnZBACPA5pWBmsdEZ8HQTZb/ioIo17CDE=;
        b=tDUWTG2+WyrEbBBikatFWNy30yAC0tj1UJZ0fIIJXc/KolLVBiYoS/zmM3ER+csSJF
         aMdgMwOu9J+EYm9cDDDsGF7QDIy/Sfrp5YgTmpnskRT3UXRcckw4t/JOfuYKHN+Rcq09
         Lvm9I2j/py36ajdIbW7M9cD1o5t3vkU9GyyzbfhpfKI1/wcJFFN+r1bMvjdGYQ9sTzv2
         QxxlMaOroFDz2tBMS09d6u2DuvozDgypnYS5srV0cvmq2V2nzwIolYKLjdyzZmjPIA63
         1SYCTbnbnP1xwmSFeHTrXl2N62cE2PysDMFOB+ipbb90cnVzvXVtdMZTsjoNGVBXGhOV
         gATQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775859141; x=1776463941;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Lpw2bwte44HnZBACPA5pWBmsdEZ8HQTZb/ioIo17CDE=;
        b=YQx+QoT7R81J0c2NlHfc6ybXrdSU5DMBXhmCPs7qZeND4kByU42AUGBmE1M26B8vpg
         9cIlvc7YF/2wbtf9mWRPTJbrtrpR4NFLGTwDeBzexQQB0mf9Bi0xZDcgkM6pnKID3K8+
         0wudibY6yhFaSI8aTX0mEG/6sutyUuFasCVit/RLA619z/70109lykyj10UiV/ZBt6rH
         vOq204KInQVzugW/gunOeC5nab+JyI/wT+lFtmPzJySHck8Ed5LWdLtUbVuHyrVWMRvI
         7Nn1WO+lkXc6Dl30cCaSBc7sSoIymyC8A3JbwL/0pBORVUud3P8GEtGjklLUsgbNMIg0
         fDxg==
X-Forwarded-Encrypted: i=1; AJvYcCXEc0ptC/Bf82puRzqUUjw3So2mN9aseTmOabJxEkII0fpAoB3YUKSu/7YtETSox468UlwwHSPo+/E=@vger.kernel.org
X-Gm-Message-State: AOJu0YxeyRbP+kUBQ5Zzwy1ZYkKVxDSAnqbrA5WJsPf8qhqvdSlZYkRn
	0XiKTEo+vcisR7X8cK8EretKwaa4JG/NCesGfQuyNTS/HtDJQebu6yoJvZqa/5iJQlwXCzz4GUN
	pRuORDA==
X-Received: from pjbgd11.prod.google.com ([2002:a17:90b:fcb:b0:35c:e06:8f50])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:270a:b0:359:8de8:1229
 with SMTP id 98e67ed59e1d1-35e428491b4mr5375577a91.21.1775859141438; Fri, 10
 Apr 2026 15:12:21 -0700 (PDT)
Date: Fri, 10 Apr 2026 22:11:47 +0000
In-Reply-To: <20260410145448.38253e3c@kernel.org>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260410145448.38253e3c@kernel.org>
X-Mailer: git-send-email 2.53.0.1213.gd9a14994de-goog
Message-ID: <20260410221220.1708137-1-kuniyu@google.com>
Subject: Re: [PATCH net] netrom: do some basic forms of validation on incoming frames
From: Kuniyuki Iwashima <kuniyu@google.com>
To: kuba@kernel.org
Cc: davem@davemloft.net, edumazet@google.com, gregkh@linuxfoundation.org, 
	horms@kernel.org, linux-hams@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, pabeni@redhat.com, stable@kernel.org, 
	workflows@vger.kernel.org, yizhe@darknavy.com
Content-Type: text/plain; charset="UTF-8"

From: Jakub Kicinski <kuba@kernel.org>
Date: Fri, 10 Apr 2026 14:54:48 -0700
> On Fri, 10 Apr 2026 14:30:42 -0700 Jakub Kicinski wrote:
> > On Fri, 10 Apr 2026 07:24:36 +0200 Greg Kroah-Hartman wrote:
> > > On Thu, Apr 09, 2026 at 08:32:35PM -0700, Jakub Kicinski wrote:  
> > > > Or for simplicity we could also be testing against skb_headlen()
> > > > since we don't expect any legit non-linear frames here? Dunno.    
> > > 
> > > I'll be glad to change this either way, your call.  Given that this is
> > > an obsolete protocol that seems to only be a target for drive-by fuzzers
> > > to attack, whatever the simplest thing to do to quiet them up I'll be
> > > glad to implement.
> > > 
> > > Or can we just delete this stuff entirely?  :)  
> > 
> > Yes.
> > 
> > My thinking is to delete hamradio, nfc, atm, caif.. [more to come]
> > Create GH repos which provide them as OOT modules.
> > Hopefully we can convince any existing users to switch to that.
> > 
> > The only thing stopping me is the concern that this is just the softest
> > target and the LLMs will find something else to focus on which we can't
> > delete. I suspect any PCIe driver can be flooded with "aren't you
> > trusting the HW to provide valid responses here?" bullshit.
> > 
> > But hey, let's try. I'll post a patch nuking all of hamradio later
> > today.
> 
> Well, either we "expunge" this code to OOT repos, or we mark it 
> as broken and tell everyone that we don't take security fixes
> for anything that depends on BROKEN. I'd personally rather expunge.

+1 for "expunge" to prevent LLM-based patch flood.

IIRC, we did that recently for one driver only used by OpenWRT ?


> 
> cc: workflows, we can't be the only ones still nursing Linux 2.2 code
