Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=51.159.59.229
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795646628;
	b=VywlUoLf+ZT2EdG2DlyiYzqf8daakqlLjgzVDlMKSnARLpKNQ+qr3y7aBFm92PLID5ok
	 zk1/dcMlfuopeYlEXpOw1Zvp214YrBU3r9ryJbXf+rG9KhWZDhY3iC/46k5YSzepdLFFH
	 90HDQgvuLujL3Mbz1BUY6PQzUoc9fLCzH92KH4XPhUpNNtBujzETgzYmOemW7ssNUl/dx
	 22HJSCbBSM6CdgeNbNUHWTHMXJVzGVyJ0cNDZkAGiUe4ASuzZGak0FL+YhfmjZvzKx2si
	 uOcHY3fvfMqk09VYtAgfwSBALeP5MjcF13WeY8k0kF/qINGskHNT8MpHzFpSCBX4j3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795646628;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=Rh+5noimc3b7EnHOL0KhcpaUUSdViGAunKg/A3ofTo8=;
	b=caM9V+7+Adu+6RyGJoa95fUzex8K2v4A7WarVfngJErNeNM4c+18IGDDwyxGurSZjTSQ
	 BPR1ZZuXkfAZ0V+ljgaoRrR/WH/pzwV3JsZ0vmJHrKbBgfbcwTFuHHviQntii/6kYupDR
	 2B5Sh8sGIjnjDBTjcNpvQJ8Fv5UEtgb6QqPN+KoLKyiC91Uo+/6A+hH+pNPMvhwrdjTD9
	 ZBSZdAwmkyHFIqEW8kI0H0PA7S/ew7K35C7qUydYQcKALND0lWljLSTGENSjXlzmOTQA6
	 wON8Gf/fJaG2fm5pIs+esJTQpZyw+6CMe/LdfbAe7PjItAcEG33Gw6kefA5xwLjgaXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=1wt.eu;
	spf=pass smtp.mailfrom=1wt.eu;
	dkim=pass header.d=1wt.eu header.i=@1wt.eu header.a=rsa-sha256 header.s=mail header.b=sLfxaplh;
	arc=none smtp.remote-ip=51.159.59.229
Received: from mta1.formilux.org (mta1.formilux.org [51.159.59.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FBE3606A31E;
	Wed, 25 Nov 2026 22:43:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8FBE3606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=1wt.eu header.i=@1wt.eu header.a=rsa-sha256 header.s=mail header.b=sLfxaplh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=1wt.eu; s=mail;
	t=1795646624; bh=Rh+5noimc3b7EnHOL0KhcpaUUSdViGAunKg/A3ofTo8=;
	h=From:Message-ID:From;
	b=sLfxaplhDp77n78QVARVRsR6dJA+b3lhW6CPDQ4zKG55kF50KCH/4a1NicqlR1peB
	 Ky1pBYsxESyUBNbo8lJOMwOkZV3rVeUHgV3zsQbxq7jPX8iY9kCRjQFUCA4BCthtIk
	 RIHTR/dl0qbBKgZG41jqehzq2BffFHMngJskZs+0=
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by mta1.formilux.org (Postfix) with ESMTP id DFB4DC0716;
	Wed, 25 Nov 2026 23:43:44 +0100 (CET)
Date: Wed, 25 Nov 2026 23:43:43 +0100
From: Willy Tarreau <w@1wt.eu>
To: Jonathan Corbet <corbet@lwn.net>
Cc: skhan@linuxfoundation.org, Randy Dunlap <rdunlap@infradead.org>,
        workflows@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        gregkh@linuxfoundation.org, Johan Hovold <johan@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>
Subject: Re: [PATCH v2 00/14] security-bugs doc updates
Message-ID: <awdknzzPLoGlWwb7@1wt.eu>
References: <20261114190014.17826-1-w@1wt.eu>
 <87zeuwx4nr.fsf@trenco.lwn.net>
 <awcW-AsAJ89rcJu3@1wt.eu>
 <87wlq0vco0.fsf@trenco.lwn.net>
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Post: <mailto:workflows@vger.kernel.org>
List-Help: <mailto:workflows+help@vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
List-Owner: <mailto:workflows+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87wlq0vco0.fsf@trenco.lwn.net>

On Wed, Nov 25, 2026 at 02:11:59PM -0700, Jonathan Corbet wrote:
> Willy Tarreau <w@1wt.eu> writes:
> 
> >> Would you like me to pick this up, or did you have another path in mind?
> >
> > Oh yes please, I would appreciate it if you pick them up. Do you think
> > it's reasonable to have them for the current release, given that as
> > always they help us on the sec list by responding with links to the
> > doc ?
> 
> I should be able to make something happen along those lines, yes.

Thank you!
Willy
