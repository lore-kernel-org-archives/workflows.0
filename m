Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793608686;
	b=4USzyIX8eE5u1Zf9THCSRHUyj0Sn+/sJf5gso/RuGa0/vemt8r56hGuQO15AoaLocVoQ
	 Bj/Ky5nIiyyVFyecbY56Exq1s4X6tZ98v48l32YzZ9LGY/XW9qau8hiYJS2OrNwkmlm/l
	 9461vVtrPpkqTzG/Ep3FbcHT0LZ7zfIxAAVKNx4SIYhSR31UtpDCo910NJzltgfx6sh53
	 CpQoRCLvCbybQ0rzkMYx9p2eSCwNy8Sg/C+H8agmtBKdUojVW0ZU2UYjaphe2ndQvO6e7
	 D12WcnUiAsiTVcS0xB9xwPwWKLU3RELt298M2ZiIRpSSdEmSLAvzyRD3o1tUSS29+Qw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793608686;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=8d0vDitzezDWa7J6bkNN1sM4Lg1Dh0lgOVgctT1VpEs=;
	b=zev7jkmPwEtnSOiMRLOupDLm4PF3rTYhnn8Alzb0jqfv35G2vMTQ2EcQvnyVjVzzwxV1
	 KOvP/YeyZrgeddIvjGlwdX7JFtOFXgB/jN8ePDzjqoAQK36ZTKLHJSJZ5yqDRDGoSd+2+
	 rEp0uX3HbNFdVXUFOu9f6+SR+fGhNQO7PKe7Ra7y9g40WncBKDV9BQOvYYFtvqCGoDrap
	 QmLvRCD7JgLxHsCYiD/iBtbQfW7zbLCji5ikpU2I+2To6nZSXiwtzVokwszMz263ljNHM
	 vCg/klpDNrr0KEgIw5JqxtL5xOvQdpPgUONFoH3s7im4cJ53oYWdHAV7ERvut05eo1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZrsJKdvD;
	arc=none smtp.remote-ip=209.85.215.178
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 643C1606A329
	for <workflows@vger.kernel.org>; Mon,  2 Nov 2026 08:38:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 643C1606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZrsJKdvD
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cc4c02ddd62so1348248a12.0
        for <workflows@vger.kernel.org>; Mon, 02 Nov 2026 00:38:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793608686; x=1794213486; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8d0vDitzezDWa7J6bkNN1sM4Lg1Dh0lgOVgctT1VpEs=;
        b=ZrsJKdvDf3wSjGkdXQOysAvdloIM9KYRnDXm+0wOiWS0uikOgM1KqCpoJEYqwbxZk+
         xkqunbMOpYJB64pTmQJymcXkuHxOg6jSGWrE6dIrZSmUDVT3rYmaUIMiZy7/i9QqAWRy
         hEL2Z5u/HKyG2GRuzE/AQD1mOn+XtY0599THDMTh8a/nrWwpHVVQimI7IMrlxxUGHv65
         hry+t4HYRYGPjHBZDeue/d+i1FnjE+i9e2LNGjSrrAdPDbAVeazDGEYSe5zX2FR8AxFv
         M13C4q77GkhZiXGkcyv8FoMDHMjW6TsrqGp3zWEDJOGqzl3mdGc5Xc0GCaIAoQXXsOVJ
         hbkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793608686; x=1794213486;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8d0vDitzezDWa7J6bkNN1sM4Lg1Dh0lgOVgctT1VpEs=;
        b=m7MNdGeIl7tt/T4xbpnhXqXZFo9PaqEKHT4oZstSIaiRTwZOwBJa1GDhEXLqrvVgmJ
         rcV/vtNzw5q7qXFRNQMIs/ZIn46j+xaM28fZPGi4RNu36JxO+AEXT//EvTaCLY2Qo5ug
         UwFx9HxOTffjvQ3hpu7VoAd/WavCu6Co9doZM0pY5hCQoz+EnpYYu+4H7H5k6rVkz+Eu
         Xpu2pcTYTE65oPJx+9Z7s08w6YTcCtSUIaKCKBKGKfL2OPRc3zDBG0/tjJYHr5N01Jb5
         xLg3dBa3icc23pcNZaOys1gyc6Argg510x/CYd3EEIT7Ui+PpkH1Mi0xAkQ+IPWT9Hta
         CA2A==
X-Forwarded-Encrypted: i=1; AKwUvBz9jUZs1ygKkJ6kRAgX/ET/mraLcy24xFscpAlVBnC6grFRPAL8VT29j262U//a/7IA4kX2er5g/BQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Og78ZQo0dwaG1Csr8GIvV6aV7MsQ5k8uclmqMscoBUP1pLUP+
	2NrG47TOsYXCrARUU7Gp9YuDjhoddG6p8wMjFUQchmbAn9Tos2FbETL8
X-Gm-Gg: AYBFou1COK8vVkTFffeKTa+X3bPtuFpzdnLkzZzvHNFbcCz/k1XTlQWMbPwxnqPL6Eh
	ABESCHANvSBdTGmZ1g8Rwpcte2+Jbkb1LG37ZP9X9bOqKr9bSokeVV0siZ5UkfK6w8KAmP+GoqC
	lTdd3qE3KQdmUe3IGi8tG4EvRaoiszQtwoq2arsOgc8zPcHA85vIRRu+W6N7SDfRq/hgOEmUDqS
	zuDSWsytFq/vsKJa55LLmtEt+4GDPIrcuvpnFjtnC2QS3uZyHFlIaNHIlh4zgXaxJcc3vUKZ+Nj
	CZh1HvdlzqydMPF+etCgoI7gOTsAP1gb0f0c5wWRNftnlJiibmFOQr33VhUaCe4YGLO9xsS1Ig7
	iZQrxrJaefrlM2VC3GfPKitgLT4lSqt/BqTZXBmJSDYr/LAv/TDlO4503YVcDIydyH5TWMRdLxQ
	E/eYIKaRi2eGFipiudIoNcInqBUzNJdUJUa5oKP2VCR+/gSpjRAgIRhmD93AOXmcUOnZ0f5dK/q
	PXnG0lP7b5dnrgHBrTf76iglYW67a5jNOUVVi/k/5oh/B8ijmaGXpXMRoLtbEjlsWYW19GFdvpE
	FwQNIBbxk1UgGeh/kigdxJ4LbmsGFsOdHqeBZZq6H8oHDzP5UT4CWRoRU81cvaKZ5mZ5e1Yu2oe
	cQ8Ay2gEij8Xz2OQmYy+qMnB0gktZTnxv2O9hmJtui3fSrc9Q25vH8MOoPhmh5ZZqXPEsLNoO5o
	LLn/35vAiVuNpp6A==
X-Received: by 2002:a17:90b:5648:b0:3ad:93b4:718f with SMTP id 98e67ed59e1d1-3ae89879b52mr8145082a91.65.1793608685557;
        Mon, 02 Nov 2026 00:38:05 -0800 (PST)
Received: from spider.bream-herring.ts.net ([103.6.151.236])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae85f3e087sm7861463a91.1.2026.11.02.00.38.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 00:38:05 -0800 (PST)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Wei-Lin Chang <weilin.chang@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-kernel@vger.kernel.org,
	workflows@vger.kernel.org
Subject: Re: [PATCH v2] Documentation/process: Add a maintainer entry profile for KVM/arm64
Date: Mon,  2 Nov 2026 16:37:59 +0800
Message-ID: <20261102083759.1561867-1-matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <6urqt376s23fcyr5pchfrrowvjoo6acg5xt4ujkft7gww6sagj@jxz5rqihtkja>
References: <20261030083351.3040604-1-matthias.goergens@gmail.com> <6urqt376s23fcyr5pchfrrowvjoo6acg5xt4ujkft7gww6sagj@jxz5rqihtkja>
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Post: <mailto:workflows@vger.kernel.org>
List-Help: <mailto:workflows+help@vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
List-Owner: <mailto:workflows+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sat, 31 Oct 2026 21:03:17 +0000, Wei-Lin Chang wrote:
>> +Minor problems are often fixed up by the maintainers when applying; if they
>> +say "no need to resend", don't.
>
> The second half of this is a little silly :P
> What about just:
>
> Minor problems are often fixed up by the maintainers when applying; ask
> if you are unsure whether to resend.

Agreed, that reads better.  I'll use your wording in v3.

Thanks,
Matthias
