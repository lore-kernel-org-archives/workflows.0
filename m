Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=51.159.59.229
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795626756;
	b=viI2A5vgRggAtaj8JuX2jcQd4s6XpXkY8Wi5lh+V8cSc+31q9VmT1fsibvoAbrSsjm+1
	 y4N2vFASfqhDb01+kBNXFtldO4mXcTuzyqfGr8hlhTZ3fUHwixClWomvfi9MlkHZCuVvQ
	 fDR75CcoqnU7J616Vpo9/ZwxaiZF1OE3AVx4SDxrmdraNg6nB1BEy0Y/UwFfdleySkvRl
	 r0ok5OyVRTOXRsJKEuZVRRTlAQAfr19/ZXihnRCYKPlabP3NihILjcC3AE+5pNMI2ctXj
	 2BChUTWQtx8D7W1JLcX6TgBIansqv6jyoSasgSYwiTJ88nE32cKHAlE8HwZAlzJF6bQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795626756;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=0PlivHjJFe8Czsts+P/E3iVHCWO3TXwLQfQtarBKz68=;
	b=Ziwgk+m7msv3W/lOYd9bOmLtQPPOpjQP6KhsD0x7I8JvGDcsx10UsaF00IRiU+WTPKGV
	 dCdb5/30IwAwIIDobcxJIsNHxctO4hrBoH/rrgiTIJN4MZstTVeazJI1IV/CZ2EuHW+kq
	 +PkjTzxmz2xh8KKdFjANCx7a2xpZ+GzIFyOZhPkhRI8kmLZfkZaDwSJ/R5ZiXvTR+lBt2
	 onB8ZK55noLiREC7cc893r0xLe35My7RG4kTJUEiRYguasqgAim3SLWwxFH4wT6UkEVuB
	 UWZIBTG+SE53nQIaq+aXwlg/5h9KSbw05pbz2QEjJjUkPgFRLJAM0e5+m/nyVyAqm2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=1wt.eu;
	spf=pass smtp.mailfrom=1wt.eu;
	dkim=pass header.d=1wt.eu header.i=@1wt.eu header.a=rsa-sha256 header.s=mail header.b=XDBF+K9b;
	arc=none smtp.remote-ip=51.159.59.229
Received: from mta1.formilux.org (mta1.formilux.org [51.159.59.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1FC0606A68E;
	Wed, 25 Nov 2026 17:12:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1FC0606A68E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=1wt.eu header.i=@1wt.eu header.a=rsa-sha256 header.s=mail header.b=XDBF+K9b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=1wt.eu; s=mail;
	t=1795626746; bh=0PlivHjJFe8Czsts+P/E3iVHCWO3TXwLQfQtarBKz68=;
	h=From:Message-ID:From;
	b=XDBF+K9b6mgGmvq1g7kdd/smij+GTnyAWGuoDpdZ0hN4OkPHNDXRN/1R0iTzfUREP
	 2xW6zek1IrNf5ahY0H77SLkycD3uhfx0MulbEx3ecUqMhynUr/q8FSV/1UcaFIP4lR
	 nR5P0/1tEzN/vnXte416bQF7QJuZIS+41TQ26QoQ=
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by mta1.formilux.org (Postfix) with ESMTP id 11044C0716;
	Wed, 25 Nov 2026 18:12:26 +0100 (CET)
Date: Wed, 25 Nov 2026 18:12:24 +0100
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
Message-ID: <awcW-AsAJ89rcJu3@1wt.eu>
References: <20261114190014.17826-1-w@1wt.eu>
 <87zeuwx4nr.fsf@trenco.lwn.net>
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
In-Reply-To: <87zeuwx4nr.fsf@trenco.lwn.net>

Hi Jon!

On Wed, Nov 25, 2026 at 09:22:00AM -0700, Jonathan Corbet wrote:
> Willy Tarreau <w@1wt.eu> writes:
> 
> > Hi,
> >
> > Here comes the v2 of a new batch of updates for the security bugs
> > doc, essentially to make it more readable and to address some of
> > its apparent contradictions for those not reading it entirely. Some
> > additions were made to explain how to send a patch and a reproducer
> > separately, and to ask that first-time reporters send a single report
> > at once first.
> 
> Would you like me to pick this up, or did you have another path in mind?

Oh yes please, I would appreciate it if you pick them up. Do you think
it's reasonable to have them for the current release, given that as
always they help us on the sec list by responding with links to the
doc ?

Thanks!
Willy
