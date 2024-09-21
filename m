Received: from fout5-smtp.messagingengine.com (fout5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A399F9DF
	for <workflows@vger.kernel.org>; Sat, 21 Sep 2024 09:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726909687; cv=none; b=PoikYLvkdHV4YA6UfbWDcIdRy1XlBjL6sutElKfBB1br8y/PUAL81h+WLBo1sJSljrwa3X++DG1zincuiyWr5hC76kCkckgkvRW1B7YjYjegYcODNvGHSja8fbZ+eY+xmYJ6JKvznASWzueE2GScADT1UoiHW5YXWEefAaNn4/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726909687; c=relaxed/simple;
	bh=ica5c3tMZEbwUKRNKjFoBa9IJbO5Szm1dAqtHzTkUMY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uyyBIPjc6ANwomQYZffYEmlqQFa0e5UUWCoZlPwtr61sHsKiHwCTBVf9Lrj9qtMBvaWOVuQr7j5ZhAFuOdnupUc6pl5a4MN7g5zzrqpD5omDZk/piHL3bCwXX8asR1iNfRC7ExDZttEa7Di5VxHyMg7U4oUX0KysApOi/gQiy3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=YTHR6MYM; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=qK4BHhsM; arc=none smtp.client-ip=103.168.172.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="YTHR6MYM";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="qK4BHhsM"
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfout.phl.internal (Postfix) with ESMTP id 0765B1380272;
	Sat, 21 Sep 2024 05:08:05 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-10.internal (MEProxy); Sat, 21 Sep 2024 05:08:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1726909685; x=1726996085; bh=LjSQhCGZp3
	Z6n2Lq9pOdzNecDdh5l7JVIV2xue6p7f8=; b=YTHR6MYMbit7GoVLh8c/9P8jCj
	kiZQ/eG2u25bN8AJH596TEQa96Vz/luTIb2zRlmF35HQY6grO/f6HFRIWmsGiik6
	epAWjzx/CNJbg6qRUVf44pve1+Wx3QAKmVAgiX3Ud+3qYOcWZgXrEuC5KgAg1uKd
	9vE4EjwfikXXUbUbHIybikHa3ah18Xhh2tZT6/XV33MzKFc7XtOCk/fMMEm1S0r8
	USQGrg6QD+Cq63qO56Iyc05LXMf8Jrm0LGF/50/MSvYp2aAuPrnorYqEbvUPdY4g
	J9kyEIao3FXyw1+EauJJNuX08+gPirRstZbHIUErIhVzQHy4fT81DSdIpFkA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1726909685; x=1726996085; bh=LjSQhCGZp3Z6n2Lq9pOdzNecDdh5
	l7JVIV2xue6p7f8=; b=qK4BHhsMYUkwpDI6LDKoCbTQKfq0d/OPN1jzlsZqSM9z
	OVqu9w9RK0up9Df4NbynTRRD19yWWu6w5BtrI0t6Ab5zLkvapnFNL0i6scQulvoB
	iJ6xZnY2B+i7qyetAYDDu4rMKKX9YNSl03B+Pw6AI888Av8AqfNyFEig4985qLXE
	x/OpWGdIjs3H33/Q9Wnszp0ONVA5+9m3lhqHwCo7Pl4J7Wg5ufn0h2La+84jGKSp
	J+dQvbD7MUtRHFHE+23zQOcpKCUEHCn/PlZOFDpfCEoH3Wd24cagN4CPqnSdueOu
	F1vDZX8qn4WKQlrCvl7j7fTPemMXaY7X6gjKUY7mrg==
X-ME-Sender: <xms:9IzuZmEmKQiJY3Z1bjxA78H2PcYEjNDru4myS22-77SyOod87fLw6g>
    <xme:9IzuZnWZYjk4Zi5dW8SmTmy9XE1m9ejijoqQTBmWjOI0i32qgFbgVmhERDDWoglGa
    3CoJVVxuKXSSg>
X-ME-Received: <xmr:9IzuZgLNFuqwoy-FpEUptjhewfJJVEeNxeXosDQOyN2T-lQV0QBUTwM5wWo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudelhedguddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvden
    ucfhrhhomhepifhrvghgucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrf
    grthhtvghrnhepheegvdevvdeljeeugfdtudduhfekledtiefhveejkeejuefhtdeufefh
    gfehkeetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epghhrvghgsehkrhhorghhrdgtohhmpdhnsggprhgtphhtthhopeegpdhmohguvgepshhm
    thhpohhuthdprhgtphhtthhopehquhhitggpjhhjohhhnhhsohhnsehquhhitghinhgtrd
    gtohhmpdhrtghpthhtohepfihorhhkfhhlohifshesvhhgvghrrdhkvghrnhgvlhdrohhr
    gh
X-ME-Proxy: <xmx:9IzuZgGCoCatsgzBtkyV-ePt3B2BcsZmbHGyQ2PpRtA2zhlQGX8lVQ>
    <xmx:9IzuZsUEVJpMU7qNrS7odMPzHiucoHedu4IZ8Y2gxe7B0K_7G3Kywg>
    <xmx:9IzuZjOike77E2dAqq0Q4kgni7BGFdbBXu46F9CERMnyxIKI2z3JvQ>
    <xmx:9IzuZj1zXZ8dLmrtiaqrfkP3TFCw4YVg7THpze0ZAs8b3dkZ4dmlhA>
    <xmx:9IzuZqxMYXV93MRdsnad5mjms7bLHq85wtZ12Hg9CSSMLcYl2TM-bSw7>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 21 Sep 2024 05:08:04 -0400 (EDT)
Date: Sat, 21 Sep 2024 11:08:03 +0200
From: Greg KH <greg@kroah.com>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: workflows@vger.kernel.org
Subject: Re: Are multiple Fixes Tags OK?
Message-ID: <2024092121-portside-impotent-2120@gregkh>
References: <1e86dfd8-8b69-4e51-8e39-524765a7b355@quicinc.com>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1e86dfd8-8b69-4e51-8e39-524765a7b355@quicinc.com>

On Thu, Sep 19, 2024 at 08:07:56AM -0700, Jeff Johnson wrote:
> I'm reviewing an internal change that is fixing a memory leak of the same
> object in two different error paths. However each of the two error paths were
> introduced in separate commits, so there would be two Fixes: tags if both of
> these are fixed with the same patch.
> 
> So is there any guidance on whether this should be one or two patches?

Ideally 2, if it's two different changes in the diff.  But we have
patches with multiple Fixes: tags all the time, it's not unusual and if
it works for you, no objection.

thanks,

greg k-h
