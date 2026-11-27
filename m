Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795806537;
	b=ABMxJ9a0aqknoTgJE7YW8mgWp2SssUDZELkKRSjuDCTq41SUa6W4yk/kKtjS+x1fqCZX
	 Cagzf3PdLi6CMOTT8eEDMH1UeCBYqzxdwEcrMEgIZjvdxhb0dIZMhDeeb4ZAwFQ26K37C
	 pWBW59GUuPPNxIt0mC46GXQV0ZBGYPWTVf6JD13JSrzpCrXW/wdNI6swGsHtFsZkCjaEQ
	 Zw8yIQz+gs1eZacoWV7qYkicszaSPDNr5ec46sbs7umQwDfTHitM2qPWzqw/LnsgDSBxi
	 c150La/999Cs0r51hNs1f3capf/Uf+hT7KU2ckBZhQSBWw+YM1rHtIvurLluGbguffw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795806537;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-Id:
	 In-Reply-To:References:X-Mailer:Mime-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=P9SKuwUFDPBABhQujd3HajxawMwgGPjhz3T3jOvDByI=;
	b=4Ruj3tungkDHgdE/csyUi1r5Qoiy5izd0WluyU4LIuT/+zrytzw5dZijdwNxmuMrQ+vy
	 12dVfZGzWZA+5OQC5IGQMGklTPGTOUfWZ4zi22etSFHb5m/6tglZRw+oSuq3d6VbN68vF
	 fq9AgnzWpS5wkRvinp9w2emTcFVIAJF82WXmgnOTB8wnBevrqE6PKK1gVECYF7r2kWsYL
	 UCwSsiPNeA4WGzGSZ34ITXlA4pVZuozWcLafDCOQHU87TNVZxGH6Qaxz39TzrXBCnjyq+
	 BQyv1wxcnivTYcQCrWpMqkXcuy6bCPsUgN+gP2fGBs3zyxrzFo3uJv4QVOklcpiPyZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=v3jIp4rQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6A8A606A31F;
	Fri, 27 Nov 2026 19:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=v3jIp4rQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 898511F00893;
	Fri, 27 Nov 2026 19:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1795806532;
	bh=P9SKuwUFDPBABhQujd3HajxawMwgGPjhz3T3jOvDByI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=v3jIp4rQGkNqC3Y//vKCcpLdU4JgVL0nhUjvAUZkSdA8Wu8EX3S1YnVwT0hOa+0jR
	 bMgdbvM+60JUbVu0enAkdQUnDs5CTwDJTMJTdZ639LtxSBPfzPH6P6KOTj+Tul2+E6
	 emVwApFQ0EZQJa3yMhX5GEYfkotyLDsN6iwXTI4A=
Date: Fri, 27 Nov 2026 11:08:51 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Sasha Levin <sashal@kernel.org>, "David Hildenbrand (Arm)"
 <david@kernel.org>, Willy Tarreau <w@1wt.eu>, Borislav Petkov
 <bp@alien8.de>, Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Corbet
 <corbet@lwn.net>, Linus Torvalds <torvalds@linux-foundation.org>, Leon
 Romanovsky <leon@kernel.org>, Mark Brown <broonie@kernel.org>, Geert
 Uytterhoeven <geert@linux-m68k.org>, Marc Zyngier <maz@kernel.org>, Eric
 Dumazet <edumazet@google.com>, Hans de Goede <hansg@kernel.org>, Andrew
 Lunn <andrew@lunn.ch>, Jonathan Cameron <jic23@kernel.org>, Shuah Khan
 <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Theodore Ts'o <tytso@mit.edu>,
 Security Officers <security@kernel.org>, workflows@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 1/2] docs: coding-assistants: ask for short changelogs
 and a cover letter
Message-Id: <20261127110851.ce0b89df5ad254c9f2125801@linux-foundation.org>
In-Reply-To: <awmrvCPm6ZI7Yd7_@gremlin>
References: <awjopqoCJqwChwnF@laps>
	<awlCy3vDs0fKx1ku@gremlin>
	<awlNYsu1y8EhYgor@1wt.eu>
	<33c6cf3a-6b18-4e09-bd5c-68ed2c34de56@kernel.org>
	<awlR9pQUjodcLjZK@gremlin>
	<20261127133756.455469-1-sashal@kernel.org>
	<awmJ2c87NSDjtSwp@gremlin>
	<20261127143124.1039470-1-sashal@kernel.org>
	<awmU4L01OH9kWEVv@gremlin>
	<20261127153902.1320179-1-sashal@kernel.org>
	<awmrvCPm6ZI7Yd7_@gremlin>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Post: <mailto:workflows@vger.kernel.org>
List-Help: <mailto:workflows+help@vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
List-Owner: <mailto:workflows+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 27 Nov 2026 16:46:58 +0000 "Lorenzo Stoakes (ARM)" <ljs@kernel.org> wrote:

> I've got the distinct impression my views are not welcome on this topic,
> rather had that feeling from the start

I agree with everything Lorenzo has written!


I dunno Sasha, everything here seems rather .... wordy.

Has anyone tried this:

- find some tens of *good* changelogs

- get it to crunch on those in order to
  generate how-to-write-changelogs.md

- argue with it for an hour, as always

- add how-to-write-changelogs.md to Linux

?
