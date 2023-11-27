Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="EKV8h6LY"
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0258C198;
	Mon, 27 Nov 2023 09:53:47 -0800 (PST)
Received: from localhost (unknown [IPv6:2601:280:5e00:7e19::646])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id A6E9D2CD;
	Mon, 27 Nov 2023 17:53:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net A6E9D2CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1701107626; bh=qIBmWZ2NAcGRd8k1fpSJnW9hjUQR4JzEufs73gSctq0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=EKV8h6LY2DOL3SW1tgMRtiHHSGbycZVzm+OrtYnjYWU994YSOakW84UR9t04dYJ6r
	 sEks6/j/HziypKCpxbKe1nP3yYqqcHKo+pMP0eSoqvIVd4gByhWJHHeXoShiiqt5F4
	 upnmCZ4SXjJ2gA/uSwbcGPt4MoZIFIrqUrEQk071h1cWJTPgnsY5njtLjhIVV2ZL0i
	 WPU30Ea01BjITug+d8XJJ4ojEtTPLO+tuSUXyDgfonabBszPnj7oA5PQ3zDz4OCser
	 HSIY/VE7q1Dsfj+L2FkPMeOUHCS28YcjWiTGJb11FuNcvdz0IaXIu7ZREt315bKPh4
	 UrjtPtNLo+OaQ==
From: Jonathan Corbet <corbet@lwn.net>
To: Borislav Petkov <bp@alien8.de>
Cc: workflows@vger.kernel.org, linux-doc@vger.kernel.org, LKML
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] docs: submitting-patches: improve the base commit
 explanation
In-Reply-To: <20231115170330.16626-1-bp@alien8.de>
References: <20231115170330.16626-1-bp@alien8.de>
Date: Mon, 27 Nov 2023 10:53:45 -0700
Message-ID: <87cyvvytee.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Borislav Petkov <bp@alien8.de> writes:

> From: "Borislav Petkov (AMD)" <bp@alien8.de>
>
> After receiving a second patchset this week without knowing which tree
> it applies on and trying to apply it on the obvious ones and failing,
> make sure the base tree information which needs to be supplied in the
> 0th message of the patchset is spelled out more explicitly.
>
> Also, make the formulations stronger as this really is a requirement and
> not only a useful thing anymore.
>
> Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
> ---
>  Documentation/process/submitting-patches.rst | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)

Applied, thanks.

jon
