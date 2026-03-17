Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0598E3DCD9B;
	Tue, 17 Mar 2026 15:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773759910; cv=none; b=bGFtVdsHHeRcRRD/YiFbjH43O2BWDgOmKJyYVioghRjw3cgZycvjvSynoBOy1lYezzIP7A4V8Z02Bmeob64Q0Tm2rsrmSjWnjikNOFHP11oA1+E1xPR+/B6dHtU2Q7rNs2xZBPelKqs/BDVUA8piYTzNfjM17xtCGFb2Fu6XpGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773759910; c=relaxed/simple;
	bh=wsh4dv4c+ULHBC1vTtcz6oegnTNzXV487qbKTAEC8Q8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=WKW6HGtjyhwZk68QIF+WjDFDM2vvggocWDDQ+EjJ9Seq5mtWDVm0cA+HRzmM5v+ksawOEemjp2jxzZC0jlymHX0E7JoV5z5MJwGvdEsH+s+0yf5Yu9CWlxIu4Z3vFd0x01DfbrUj1xhalTpkzpkh/K8A+NTnlh7uoIzMV1DDsow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=st5aCHzu; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="st5aCHzu"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 5732B40C7C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1773759908; bh=+OSidxMci+Gd+HlAyjLC3yxKANd7CVDnPR5T8GEejKg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=st5aCHzubcxz9a8FHsxy0wK86ueUGONoaPuPaeRicrP+Qine07p1iwUWksmK7GhCq
	 1gyLVtlgtLygQi3/LEyfcAcJCKXSVRI+Wdn7qrYlq9OIHeJcpnK2vQMI5zEuPBqDd3
	 f0zuFfFNg2y0ODcivzY4W54eicH1NCLquY6VaDigbqpnQuVk42P+RhEH8V9Vm2vNfc
	 S7rzmLlJz75efv/DmYz/2didyzWaQbIHn5G0vm+j+aHuOmHtazqyGJvJrOS2tFi7sY
	 zxgwVl/iCAY6SURWuwfX8b0QmzVQGKBcPYNqlpjUFTPEScueMqwA1dgwg/CTUc2eot
	 4rWDNJ59qywcw==
Received: from localhost (c-71-229-227-126.hsd1.co.comcast.net [71.229.227.126])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 5732B40C7C;
	Tue, 17 Mar 2026 15:05:08 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Manuel Ebner <manuelebner@airmail.cc>, Collin Funk
 <collin.funk1@gmail.com>, Shuah Khan <skhan@linuxfoundation.org>
Cc: workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Manuel Ebner <manuelebner@airmail.cc>
Subject: Re: [PATCH v4 3/4] scripts: ver_linux: sort
In-Reply-To: <20260312002535.191111-2-manuelebner@airmail.cc>
References: <20260311164935.183495-3-manuelebner@airmail.cc>
 <20260312002535.191111-2-manuelebner@airmail.cc>
Date: Tue, 17 Mar 2026 09:05:07 -0600
Message-ID: <87bjgmcx98.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Manuel Ebner <manuelebner@airmail.cc> writes:

> It is a pain in the ass to compare the software versions on the running
> system (scripts/ver_linux) with the minimal required versions.
> Sorting both lists the same way makes side-by-side comparisons a simple task.
>
> sort output alphabetically

Sort the output of *what*?  Yes, one can figure it out from reading the
patch, but you shouldn't make readers do that.

> Signed-off-by: Manuel Ebner <manuelebner@airmail.cc>
> ---
>  scripts/ver_linux | 64 +++++++++++++++++++++++------------------------
>  1 file changed, 32 insertions(+), 32 deletions(-)

Thanks,

jon
