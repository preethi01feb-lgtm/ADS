#include <stdio.h>

// Merge two halves
void merge(int arr[], int left, int mid, int right) {
    int i = left;      // Starting index for left subarray
    int j = mid + 1;   // Starting index for right subarray
    int k = 0;         // Starting index for temp array

    int temp[right - left + 1];

    // Merge the two halves into temp[]
    while (i <= mid && j <= right) {
        if (arr[i] <= arr[j])
            temp[k++] = arr[i++];
        else
            temp[k++] = arr[j++];
    }

    // Copy remaining elements of left subarray
    while (i <= mid) {
        temp[k++] = arr[i++];
    }

    // Copy remaining elements of right subarray
    while (j <= right) {
        temp[k++] = arr[j++];
    }

    // Copy temp array back into original array
    for (i = left, k = 0; i <= right; i++, k++) {
        arr[i] = temp[k];
    }
}

// Merge Sort function
void mergeSort(int arr[], int left, int right) {
    if (left < right) {
        int mid = (left + right) / 2;

        // Sort first half
        mergeSort(arr, left, mid);

        // Sort second half
        mergeSort(arr, mid + 1, right);

        // Merge the two halves
        merge(arr, left, mid, right);
    }
}

int main() {
    int n;

    printf("Enter number of elements: ");
    scanf("%d", &n);

    int arr[n];

    printf("Enter %d elements: ", n);
    for (int i = 0; i < n; i++) {
        scanf("%d", &arr[i]);
    }

    mergeSort(arr, 0, n - 1);

    printf("Sorted array: ");
    for (int i = 0; i < n; i++) {
        printf("%d ", arr[i]);
    }

    return 0;
}
