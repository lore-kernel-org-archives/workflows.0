Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.79.88.28
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795641130;
	b=Y3Nt5hDutud6D6oLavsLXE/dDkeH0j/dYWgW/HMW8EyeMELQRpmnIyxXUmVCYmU4N134
	 xQusL2D3/rs2Qe2dlkaAKC/bu4Z+hhVoICG1o7ZU2tuyyjQ4APziDA4hnHWXgqZxGIkeT
	 MJgSRL8hQYaFbLJ0lXn3IFWlkCocAoUmJdwcHkQ7Q/d7Ycq7W8krRz5RUn1yzDANyBLDW
	 nMI6rzySbuxvoOTcUNWGiCBSvz1aXIbEI36wBGyrbuEC/L+vnWM+I/by3fdsxiSFUVGMS
	 WkBKCBaBcpdXF8Lj0XcmnUReKxzzivvbeCw/HfV4L5FCk28milOR+VtPdFLcgQ1KnMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795641130;
	h=DMARC-Filter:DKIM-Filter:DKIM-Signature:Received:From:To:Cc:Subject:
	 In-Reply-To:References:Date:Message-ID:MIME-Version:Content-Type;
	bh=e5zVEhPpT+s1M5ZqzFKU5H7/Jx6E9EQvFE5jb4+IkgU=;
	b=MW/LSB56cSJ34iCQeM+W0KC5u8gllXAboLZLUNccVzw8bEz/2n+mSQafcwAxXUlF2OY6
	 KirBcqsD+4/hp5rUx4uea459HHl44h56ds6+FfNdvyqbGmcszoFDsWdyLBezMFGr4ADrl
	 AcErpstqvBeMfnQC/0HOBtNM6v65FasKHkjFexDKGMt3mBRnLF2uGxZpM8pkvNwxG42K8
	 iBIS28mMJnxR7rWPY7C3GtkFjVirILqz9nW5Kqiqu+IZTgtuggBWUXBwCctWkL2qAuZ6h
	 YaF+86IvL9kuQHPf2AptjMvkMVz8tshxR1DPtBi4GcJNztTmQgwyVH0S4OfsCbafcvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lwn.net;
	spf=pass smtp.mailfrom=lwn.net;
	dkim=pass header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=qixW+HFG;
	arc=none smtp.remote-ip=45.79.88.28
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6D6D606A323;
	Wed, 25 Nov 2026 21:12:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6D6D606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=qixW+HFG
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net E5012410B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1795641129; bh=e5zVEhPpT+s1M5ZqzFKU5H7/Jx6E9EQvFE5jb4+IkgU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=qixW+HFGX6KZ8smBj7lwTUXeAClTEsOU0TP0uo0XMg50KObDOMmcDM8V0UDgI2j0D
	 XCCZ0eVT3WmsEsqd3/ThwC09ogmvb5gXxXDf5l5eAUQ+cdTmfvNuWi29nf/YSLeUvH
	 Zy+NwZYLnxGNMF25iD5xYAZhR5swPiZtkW/6S7SCrKvG1XUGhlouIW5RGFMBsiJnIT
	 KYPM3gpomb+MLDe0614YOFl2fxmtQ6ElSqA6kG6S5zTfD9AqGnoz+AkAXQiOkdFQ17
	 dgnyvH1aKawg7mzu87hMl1dxI7wLH51s2REJ6QtdXcZqMpZOQD56vrJ5vzmD9ts9d1
	 GPibi+dG6t8wA==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id E5012410B4;
	Wed, 25 Nov 2026 21:12:06 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Willy Tarreau <w@1wt.eu>
Cc: skhan@linuxfoundation.org, Randy Dunlap <rdunlap@infradead.org>,
 workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 gregkh@linuxfoundation.org, Johan Hovold <johan@kernel.org>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman
 <horms@kernel.org>
Subject: Re: [PATCH v2 00/14] security-bugs doc updates
In-Reply-To: <awcW-AsAJ89rcJu3@1wt.eu>
References: <20261114190014.17826-1-w@1wt.eu>
 <87zeuwx4nr.fsf@trenco.lwn.net> <awcW-AsAJ89rcJu3@1wt.eu>
Date: Wed, 25 Nov 2026 14:11:59 -0700
Message-ID: <87wlq0vco0.fsf@trenco.lwn.net>
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Post: <mailto:workflows@vger.kernel.org>
List-Help: <mailto:workflows+help@vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
List-Owner: <mailto:workflows+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

Willy Tarreau <w@1wt.eu> writes:

>> Would you like me to pick this up, or did you have another path in mind?
>
> Oh yes please, I would appreciate it if you pick them up. Do you think
> it's reasonable to have them for the current release, given that as
> always they help us on the sec list by responding with links to the
> doc ?

I should be able to make something happen along those lines, yes.

Thanks,

jon
