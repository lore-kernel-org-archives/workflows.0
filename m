Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BC773793A9;
	Fri, 12 Jun 2026 19:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781292053; cv=none; b=NdPP53brDMuzF01In8X41BJc+AXjK5zpg3TGJyTnP+bPtgR2NQsnKW1kZkKIWS+e2JTRBMuusgTQFMx33Y0ATAIZ97wEW3QT8lfCmWerTPRjVF804IyPM1noZV5st4NFhXcciRDzrjSY2wu0/4b6NmSVitZ2jX0Z3q+BCxBMnWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781292053; c=relaxed/simple;
	bh=BJa17qIuJY4RG7VnuxZTBKCt7UpY8DhM4Xd6RHzIMzM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=AaDeaIMMxOz87OnogJXsEsbWxc4zrRBUqlxwdhfvulOG18fYDoia23saaDlZtkl+tEP1ZT4rCx7T62Yc/094F2C2l6al0luINW9pu9oWivXfnqteUQ26yGFc8f0k+BPzTSY+QG4+3KBEF4T0lHo5AVJRXJZvmmVke949dosuWPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=ruBKkg8u; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="ruBKkg8u"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net D6DAC410AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1781292039; bh=MGMghaRsZ1QS+Ihmf72LLL5qYKRppPIOFD+FpKtXvZU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=ruBKkg8uie6ntjpdaNfPlA0vfpSXl1RzRj2F7QkqF3b9ZLvAcQN8HrL6xRQMAd1wS
	 /LzIS5xLob0Z+pWdgutQnf3V3VhiPvNeNMTAxIO4XGf/qGNfaIjYzOJcZNL+jGiCzr
	 yWw6g3IzsxCW7pU+xSYvKmXNECh8uICwPqXDn9P81ol1pjz7xHHC3pPVN9HpRYtA9D
	 Ye4zQhnOyRM6F9HfElZRrIyLnqM4qLLhTZ+Sbo1eShhsdAXDND8uf9+5qUxaJQO3tV
	 PIlD+Sk7PilavGWRK1KbencW/3w6EwxcbnoNIdrUhzAB6Z7WKHpdzs5wWWjnV2qtat
	 zIFWLS4sc5NHA==
Received: from localhost (unknown [IPv6:2601:280:4600:27b:67c:16ff:fe81:5f9b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id D6DAC410AA;
	Fri, 12 Jun 2026 19:20:38 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Manuel Ebner <manuelebner@mailbox.org>, Shuah Khan
 <skhan@linuxfoundation.org>, "open list:DOCUMENTATION PROCESS"
 <workflows@vger.kernel.org>, "open list:DOCUMENTATION"
 <linux-doc@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Cc: Manuel Ebner <manuelebner@mailbox.org>
Subject: Re: [PATCH] Documentation: process: fix brackets
In-Reply-To: <20260611064311.117023-2-manuelebner@mailbox.org>
References: <20260611064311.117023-2-manuelebner@mailbox.org>
Date: Fri, 12 Jun 2026 13:20:37 -0600
Message-ID: <87ik7n7egq.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Manuel Ebner <manuelebner@mailbox.org> writes:

> Fix missing ')' and needless ')'
>
> Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>
> ---
> This is the first patch of a 'series', but I won't send them together
> because I'm still producing the patches and it will take me a couple weeks.
>  Documentation/process/deprecated.rst     | 2 +-
>  Documentation/process/maintainer-soc.rst | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied, thanks.

jon
