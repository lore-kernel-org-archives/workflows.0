Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9697938AC72;
	Mon, 30 Mar 2026 16:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774888370; cv=none; b=GWkHdWcVi2GkFp40YqhZbgf8eyUyjkpLmmaEVfADbmITvTj+WR3TfL0bnMz44ogMIwqKMxTsC7hjQk/iXrBMSLQcphS/BDmN0MKCQe6CmdTfy6z0pk+cweI7AeZ03lKRt2VZZ/rmKxSbZg1Eoyr9p5BHSna/dRtnt10ur7uQjrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774888370; c=relaxed/simple;
	bh=DowcYXHxw1UIQQz6dcPkMptzAoGH4rhEct4cPw+hFt4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=BSyLZ7sMxD1TTOi/h+iEZVtRUkIVhV6OuW8Tos8XUXigdMZaxPyh+N6SkSa1XDQfK9EXdaPTmB88BiXKmtXA/lxXGyoQ+vnrKAVrO8F+EW9sEFqIq11IDUi+8sd9SvL4fm5xEmNzNelMup+wFWSEXae3/5KaaiYOPeDhlRQSaNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=mo/6LVzl; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="mo/6LVzl"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net D44BF411C2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1774888369; bh=nHdBxnP2sDRdgVVbbxueF/m0R+DAYFtw31BMb0IpMbo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=mo/6LVzlCAvSTvzvecZYIAx+a7F8+OFkn/D55z2a2oDZT3tdNIEppPTqaqpTvkI7l
	 CqY0K35qyk2sy6HvmE4WWgCaWeVtptwtoJjlli8IjSjC42ZY7CZVBhjERiDcEMr7Ee
	 kgm/1/+yoRRKAINb2rdYCW3OVMK0W9PgFYb3g/oPa5hsXEr14B1cpqAQIX4CI93k5P
	 eobvbJ/TxBm15i3nfZO7yT++Bv/aQJoPD97wyCqQPDEzdAwek3gev+up/zaNOjvl/3
	 nRToAcCixTbXUu7wuRPvIPYmrBMhAc11PZvniZwYnWWujqsAKy6GtYAZkM/40NkJ9L
	 ukG/u8NrkYe2A==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id D44BF411C2;
	Mon, 30 Mar 2026 16:32:48 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Manuel Ebner <manuelebner@mailbox.org>, Collin Funk
 <collin.funk1@gmail.com>, Shuah Khan <skhan@linuxfoundation.org>
Cc: workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Manuel Ebner <manuelebner@mailbox.org>
Subject: Re: [PATCH v5 0/2] workflow, scripts: sort changes.rst and ver_linux
In-Reply-To: <20260325194326.77923-2-manuelebner@mailbox.org>
References: <20260325194326.77923-2-manuelebner@mailbox.org>
Date: Mon, 30 Mar 2026 10:32:47 -0600
Message-ID: <87fr5hnuq8.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Manuel Ebner <manuelebner@mailbox.org> writes:

> restructured the patch series into logical changes.
> fixed changelogs, but i'm not super content.
>
>  [v4] -> [v5]:
> undo "remove (optional)" from [v4]
> merged patches with same concepts 
>  [PATCH v4 1/4], [PATCH v4 2/4] -> [PATCH v5 1/2]
>  [PATCH v4 3/4], [PATCH v4 4/4] -> [PATCH v5 2/2]
> fix changelogs for the individual patches

OK, I have applied this series.  For any future changes, though, I
really need you to work on your changelogs.

The 0/N cover letter should describe what the series as a whole does,
you didn't do that here.

For the individual patches, I have rewritten the changelogs; I'll reply
to each with what I've done.

Thanks,

jon
